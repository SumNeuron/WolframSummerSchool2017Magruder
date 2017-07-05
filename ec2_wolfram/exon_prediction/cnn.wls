#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Title:: *)
(*Exon Prediction*)


(* ::Chapter:: *)
(*Functions*)


(* ::Subchapter:: *)
(*Neural Network Architectures*)


(* ::Section::Closed:: *)
(*Convolution Block*)


Clear[convolutionBlock]
convolutionBlock::usage="Basic convoultion neural network architecture modified for handing sequences of strings. Returns a NetChain as follows:\n\tConvolutionLayer --> BatchNormalizationLayer --> ReshapeLayer --> ElementwiseLayer";
convolutionBlock[
"Channels"->channels_,
"Kernel"->kernel_,
"SequenceLength"->seqLen_,
convOpts___
]:=NetChain[{
ConvolutionLayer[channels,kernel,convOpts],
ReshapeLayer[{channels,seqLen,1}],
BatchNormalizationLayer[],
ReshapeLayer[{channels,seqLen}],
ElementwiseLayer[Ramp]
}]


(* ::Section::Closed:: *)
(*Convolution Block Chain*)


convolutionalChain[
"Channels"->channels_,
"Kernel"->kernel_,
"SequenceLength"->seqLen_,
"PaddingSize"->pad_,
"InitalStride"->initStride_,
"ChainLength"->chainLen_,
convOpts___]:=
Module[
{nonDownsizedConvolutionBlocks=chainLen-1,netChain,downsizedConvolutionBlock},
(* Create the downsized cnn block *)
downsizedConvolutionBlock=convolutionBlock["Channels"->channels,"Kernel"->kernel,"SequenceLength"->seqLen,"PaddingSize"->pad,"Stride"->initStride,convOpts];

(* Start a NetChain with the downsized cnn block *)
netChain={downsizedConvolutionBlock};

(* Table non-downsized blocks for {i,chainLen-1} and append to the netChain *)
Table[
AppendTo[
netChain,
convolutionBlock["Channels"->channels,"Kernel"->kernel,"SequenceLength"->seqLen,"PaddingSize"-> pad,"Stride"-> 1,convOpts]
],{i,nonDownsizedConvolutionBlocks}
];

(* Return the NetChain*)
NetChain[netChain]
]



(* ::Section:: *)
(*Residual Convolution Block Chain*)


residualConvolutionalChain[
"Channels"->channels_,
"Kernel"->kernel_,
"SequenceLength"->seqLen_,
"PaddingSize"->pad_,
"InitalStride"->initStride_,
"ChainLength"->chainLen_,
convOpts___]:=Module[
{nonDownsizedConvolutionBlocks=chainLen-1,netGraph,netGraphConnections,downsizedConvolutionBlock},
(* Create the downsized cnn block *)
downsizedConvolutionBlock=convolutionBlock["Channels"->channels,"Kernel"->kernel,"SequenceLength"->seqLen,"PaddingSize"->pad,"Stride"->initStride,convOpts];

(* Start a NetGraph with the downsized cnn block *)
netGraph={downsizedConvolutionBlock};

(* Table non-downsized blocks for {i,chainLen-1} and append to the netGraph *)
Table[
AppendTo[
netGraph,
convolutionBlock["Channels"->channels,"Kernel"->kernel,"SequenceLength"->seqLen,"PaddingSize"->pad,"Stride"->1,convOpts]
],{i,nonDownsizedConvolutionBlocks}
];

(* Add the TreadingLayer to enable the residual architecture *)
AppendTo[netGraph,ThreadingLayer[Plus]];

(* Specify the residual architecture *)
netGraphConnections=Flatten[Join[Table[i->i+1,{i,chainLen}],{1->chainLen+1}]];
(* Return NetGraph*)
NetGraph[netGraph,netGraphConnections]
]



(* ::Subchapter:: *)
(*Classifier Measurements*)


(* ::Section:: *)
(*GPU Version (written by Matteo)*)


GPUClassifierMeasurements[net_, set_] := Block[
  {predictions, labels, pairs, confMat},
  
  predictions = net[set[[All, 1]], TargetDevice -> "GPU"];
  labels = set[[All, 2]];
  
  pairs = Transpose@{labels, predictions};
  
  confMat = 
   Map[Count[
      pairs, #] &, {{{"Exon", "Exon"}, {"Exon", 
       "Intron"}}, {{"Intron", "Exon"}, {"Intron", "Intron"}}}, {2}];
  
  <|
   "Accuracy" -> N@Mean@Boole[SameQ @@@ pairs], 
   "ConfusionMatrix" -> 
    TableForm[confMat, 
     TableHeadings -> {{"ExonA", "IntronA"}, {"ExonP", "IntronP"}}]
   |>
  ]


(* ::Section:: *)
(*Convert Dataset to Rules for Classifier Measurements*)


cmDataset[networkData_Dataset]:=(Rule@@Normal[#][[All,2]])&/@Normal[networkData]


(* ::Chapter:: *)
(*Pipeline*)


(* ::Subchapter:: *)
(*Get Data*)


Print["Loading Data"];


Print["\tTraining Set"];
trainingSet=Import[FileNameJoin[{"~/exon_prediction","data","large","training_set.mx"}]]; (*$ScriptCommandLine[[1]]*)
Print["\tValidation Set"];
validationSet=Import[FileNameJoin[{"~/exon_prediction","data","large","validation_set.mx"}]];
Print["\tTest Set"];
testSet=Import[FileNameJoin[{"~/exon_prediction","data","large","test_set.mx"}]];
lengthOfSequence=Length@Characters@First@Normal@First@testSet;
Print["Usinging Sequences of length " <> ToString[lengthOfSequence]];


(* ::Subchapter:: *)
(*Define Network*)


Print["Initializing Net"];


net=NetInitialize[
	NetChain[{
		TransposeLayer["Input"->{600,4}],
		residualConvolutionalChain[
			"Channels"->64,"Kernel"->{3},"SequenceLength"->300,
			"PaddingSize"->1,"InitalStride"->2,"ChainLength"->4
		],
		LongShortTermMemoryLayer[64],
		SequenceLastLayer[],
		(*AggregationLayer[Mean],*)
		LinearLayer[2],
		SoftmaxLayer[]
	},
		"Input" -> NetEncoder[{"Characters", "ATCG", "UnitVector"}],
		"Output" -> NetDecoder[{"Class", {"Exon", "Intron"}}]
	]
];


(* ::Subchapter:: *)
(*Train Network*)


trainedNet=
NetTrain[
	net,
	trainingSet,
	ValidationSet->validationSet,
	TargetDevice->"GPU",
	(*MaxTrainingRounds\[Rule]200,*)
	Method->{"ADAM","LearningRate"->0.0001},
	(* Output Learning Rate (not needed if set via Method Option )*)
	TrainingProgressFunction->{
		Function[
			If[
				#Batch===1&&#Round===1,
				Print["\n\nInitial Learning Rate:\t"<>ToString[MXNetLink`$LastInitialLearningRate]<>"\n\n"],
				Null
			]
		]
		,"Interval"->Quantity[1,"Batches"]
	}
];


(* ::Subchapter:: *)
(*Measurements of Trained Network*)


Print["Calculating Classifier Measurments"];
Print["\tTest Set"];
cmTest=GPUClassifierMeasurements[trainedNet,cmDataset[testSet]];
aTest=cmTest["Accuracy"];
Print["\t\tAccuracy:\t"<>ToString[aTest]];
Print["\tTraining Set"];
cmTrain=GPUClassifierMeasurements[trainedNet,cmDataset[trainingSet]];
aTrain=cmTrain["Accuracy"];
Print["\t\tAccuracy:\t"<>ToString[aTrain]];


(* ::Subchapter:: *)
(*Export*)


Print["Exporting Network"];
fileName="net_test_accuracy_"<>ToString[aTest]<>"_train_accuracy_"<>ToString[aTrain]<>".wlnet"
fullPath=FileNameJoin[{"~/exon_prediction","results","nets",fileName}];
Export[fullPath, trainedNet];
