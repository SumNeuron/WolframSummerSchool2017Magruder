
# Abstract
Due to poor identification, exons have remained obscure from study in biology often substituted for the analysis of their respective genes. However, as protein coding regions, mutations therein can give rise to disease thus making them imperative to understand for pathology. Recently over 500 novel mutually exclusive spliced exons were detected, suggesting that the human genome might harbor tens of thousands of yet undiscovered exons, many of which may carry disease-causing mutations. I aim to use Deep Learning, a machine learning technique that has recently revolutionized speech recognition (Siri) and natural language processing (Goolge translate), to significantly extend the set of known human exons. Exon candidates can be experimentally validated (focusing on novel exons that may be involved in human disease). This project combines cutting-edge computational and experimental techniques to elucidate a core determinant of human life - the genome.


# Introduction
## Exons
### Overview
Exons are the protein-coding regions of genes. As such, mutations therein manifest in the protein product putatively altering protein function. While not all exonal mutations have notable effect, e.g. a single-nucleotide polymorphism (SNP) mutation resulting in the intended codon (silent mutation) UUU(Phe)→UUC(Phe), there are notable examples where a single SNP altering a codon (missense mutation), has profound consequences such as sickle cell anemia GAG(Glu)→GUG(Val). Therefore, given this direct link of a genomic mutation within an exon to disease manifestation, it is of fundamental interest to identify exons within genome sequences. As such, there has been a slew of efforts to predict various attributes about (specific) exons, e.g. exon-intron structure, epigenetic signatures, binding sites therein, splicing patterns etc [1–3, 5, 13, 22, 23, 63, 69, 80, 86, 93]. However, these attempts have not generalized for the purpose of identifying exons and often, therefore, rely on known exons.

![Figure 2.1][fig2.1]

RNA sequencing (RNA-seq) studies allow for the analysis of both differentially expressed exons (DEEs) and differentially expressed genes (DEGs) . As the technology to do so becomes cheaper, there has been a profound rise in RNA-seq studies over recent years (fig. 2.1). However, given the general lack of annotation and knowledge of exons, it is no surprise that the ratio of DEE to DEG studies is about 0.23% (from a National Center for Biotechnology Information, NCBI, search). Thus there exists a staggering amount of unused data in the form of DEE analysis. How these terabytes of RNA-seq data can be used as discussed later. Should exon prediction and annotation improve, these currently unknown exons could then be related to disease.



### Case Study (MXEs)
Mutually exclusive splicing events are a subset of alternative splicing whereby one exon of many reaches the final transcript [7, 46, 47, 55, 57, 59, 62, 82]. Where alternative splicing grants genes modularity in their products, often highlighted by the gene DSCAM from which 38,016 isoforms might arise, mutually exclusive exons (MXEs) are not functionally redundant (fig 2.2) [45, 57, 63, 70]. Thus while alternative splicing is highly pervasive – an estimated 95% - 100% of genes with multiple exons participate – MXEs have previously been reported to fall within 118 to 167 cases in humans [62, 78, 82]. These few cases, however, have profound impact, often causal of diseases such as Timothy syndrome, cardiomyopathy, and cancer [15, 56, 74, 75]. Thus imperative is the unpublished work of the Bonn Lab (Vidal et al. in preparation) where we report almost an order of magnitude (from ∼ 160 to 1399) more human MXEs, of which 47% are novel, unannotated exons. Further, these MXEs are significantly enriched in pathogenic, disease-causing mutations (fig 2.3).

![Figure 2.2][fig2.2]


![Figure 2.3][fig2.3]

To highlight the importance of MXEs involved with disease we consider the case of when single-nucleotide polymorphisms (SNPs) are present (fig 2.3), such as with the gene ACTN4 (fig 2.4). Any one of the possible SNPs in the MXE 8a produces the kidney disease familial focal segmental glomerulosclerosis (FSGS). Given the MXEs’ (8a and 8b) striking sequence similarity, similar mutations in 8b and consequences thereof is not unfathomable e.g. as MXE 8b in preferentially expressed in the brain, mutations in MXE 8b may lead to a brain disease. Interestingly, MXE 8a’s pair, 8b, was only recently, via Vidal et al’s work, identified. Thus if an individual whom was ailed by a kidney or brain diseases had their exome sequenced, currently results would over-look mutations in 8b as medical practitioners are not primed to search for this novel exon. Further, if MXE 8a was mutated but 8b was not, it may be possible to counteract MXE 8a’s SNPs via regulation of mutually exclusive splicing (fig 2.4. Thus it is clear that neglecting to improve exon prediction, identification, and annotation has immediate impact on human lives.

![Figure 2.4][fig2.4]

A somewhat recent estimate suggests that there are ∼234,000 exons [67] Thus if we find a conservative 10% increase from our predicted exons, then that produces 23,400 novel exons. To put this in perspective, using the same estimates of genes from Sakharkar et al (2004), that would be almost one novel exon per gene.


## Deep Learning
Artificial neural networks (ANN) handle massive, multi-variate and diverse data-sets very well [6, 11, 14, 16, 19, 24, 28, 39, 40, 43, 50, 54, 64, 68, 83, 90]. Notably ANNs have been used for their ability to automatically approximated whatever functional form best characterizes the data, via successive feature abstraction, where such relationships are otherwise challenging to understand [1, 6, 11, 29, 39, 40, 43, 49, 54, 61, 68]. Deep-learning – large scale ANNs – elevate this process to greater precision by handling both greater parameters and utilization of more features. These deep neural networks (DNNs) achieve this via sequentially transforming the raw input data into evermore abstracted features. Therefore it is not surprising to see an increased use of such a powerful tool. NVIDIA, one of several computational companies (such as Cray, IBM, Intel, etc), alone shows both increasing demand from and spread across industries (fig 2.5); An examination of one such user, Google, by itself demonstrates that use within such a client is also increasing at rapid rates (fig 2.6). Recently a series of papers in Bioinformatics by Frey’s Lab have demonstrated the promising application of Bayesian neural networks (BNN) towards alternate splicing [4, 38, 48, 62, 87, 88]. However, their model is far from complete; for example, only handling three adjacent exons. Nonetheless, the DNN approach has outperformed other machine learning techniques [1, 87], thus they have been adapted for a variety of biological purposes such as: prediction of mutation effects, regulatory genomics, and image classification of cells (e.g. cancerous or not) [1, 49]. For a directed review of deep learning in genomic biology see Angermueller et al. (2016) [1].

![Figure 2.5][fig2.5]
![Figure 2.6][fig2.6]



## End Objectives
Thus given 1.) the functional link between exonal mutations and pathology 2.) the lack of exon site prediction and annotation and 3.) the unprecedented amount of un-analyzed data resultant of point 2 we aim to apply a DNN to sequence and sequenced data for exon prediction, discovery, and disease relevance evaluation. However, our true end goal follows the completion of this model, when we make this tool publicly available for others to benefit from. As stated above, even conservative improvements in exon identification will have a profound impact on the exon landscape. DEE analysis can not be performed on an exon if that exon is not known to exist, such reasoning holds true for proteomics and gene prediction. Most important is the impact improved exon annotation would have on SNPs. The NCBI estimates ∼150,000,000 SNPs in the human genome and there has been attempts to identify and annotate how SNPs in non-coding regions contribute to human diseases reviewed in [91]. However, many of these non-coding SNPs will likely reside in our predicted exons. Utilizing the information DeepExome will generate, i.e. the novel exons in which these "non-coding" SNPs reside in, and subsequently their host genes, tools like the Online Mendelian Inheritance in Man (OMIM) will greatly relieve this effort. Understanding how a SNP in a coding region of a gene, and hence the protein product, produces a pathology is a simpler task than that of a non-coding SNP.

As MXEs have a high incidence in disease, a sub-set of this goal aims at improving MXE prediction and splicing patterns. Especially as alternate splicing patterns of MXEs may be a therapeutic means of the disease they induce. Further justification in this sub-goal is that current alternate splicing identification algorithms fall short in several regards. Foremost, it is known that alternate splicing affects clusters of exons, not just tandem triplets as previously modeled [87, 88].

In closing I will leverage a convolutional neural network to try and classify exon sequences for the subsequent prediction.


# Citations
1. Angermueller, C., Pärnamaa, T., Parts, L. & Stegle, 7. O. Deep Learning for Computational Biology. eng.
Mol. Syst. Biol. 12, 878. issn: 1744-4292 (2016).
2. Baldi, P., Brunak, S., Chauvin, Y., Engelbrecht, J. & 8. Krogh, A. Periodic Sequence Patterns in Human Exons. eng. Proc Int Conf Intell Syst Mol Biol 3, 30–38. issn: 1553-0833 (1995).
3. Baldi, P., Brunak, S., Chauvin, Y. & Krogh, A. Naturally Occurring Nucleosome Positioning Signals 9. in Human Exons and Introns. eng. J. Mol. Biol. 263, 503–510. issn: 0022-2836 (Nov. 1996).
4. Barbosa-Morais, N. L. et al. The Evolutionary 10. Landscape of Alternative Splicing in Vertebrate Species. eng. Science 338, 1587–1593. issn: 1095-9203 (Dec. 2012).
5. Batzoglou, S., Pachter, L., Mesirov, J. P., Berger,
B. & Lander, E. S. Human and Mouse Gene Struc11. ture: Comparative Analysis and Application to Exon Prediction. en. Genome Res. 10, 950–958.
issn: 1088-9051, 1549-5469 (Jan. 2000).
6. Bekat, T., Erdogan, M., Inal, F. & Genc, A. Predic-
tion of the Bottom Ash Formed in a Coal-Fired Power Plant Using Artificial Neural Networks. En12. ergy 45, 882–887 (2012).
7. Blencowe, B. J. Alternative Splicing: New Insights from Global Analyses. eng. Cell 126, 37–47. issn: 0092-8674 (July 2006).
8. Buchert, R. et al. A Peroxisomal Disorder of Severe Intellectual Disability, Epilepsy, and Cataracts due to Fatty Acyl-CoA Reductase 1 Deficiency. eng. Am. J. Hum. Genet. 95, 602–610. issn: 1537-6605 (Nov. 2014).
9. Capece, V. et al. Oasis: Online Analysis of Small RNA Deep Sequencing Data. Bioinformatics 31, 2205–2207. issn: 1367-4803 (July 2015).
10. Castillo, E. & Gutiérrez, J. M. Nonlinear Time Series Modeling and Prediction Using Functional Networks. Extracting Information Masked by Chaos. Physics Letters A 244, 71–84. issn: 03759601 (July 1998).
11. Chattopadhyay, S., Jhajharia, D. & Chattopadhyay, G. Univariate Modelling of Monthly Maximum Temperature Time Series over Northeast India: Neural Network versus Yule–Walker Equation Based Approach. Meteorol. Appl. 18, 70–82 (2011).
12. Crews, D. The Development of Phenotypic Plasticity: Where Biology and Psychology Meet. Dev. Psychobiol. 43, 110 (2003).
13. Curado, J., Iannone, C., Tilgner, H., Valcárcel, J. & Guigó, R. Promoter-like Epigenetic Signatures in Exons Displaying Cell Type-Specific Splicing. Genome Biol 16. issn: 1474-7596. doi:10.1186/ s13059-015-0797-8. (Visited on 09/29/2016) (2015).
14. Dave, V. & Dutta, K. Neural Network Based Models for Software Effort Estimation: A Review. Artif Intell Rev 42, 295–307 (2014).
15. David, C. J., Chen, M., Assanah, M., Canoll, P. & Manley, J. L. HnRNP Proteins Controlled by cMyc Deregulate Pyruvate Kinase mRNA Splicing in Cancer. eng. Nature 463, 364–368. issn: 14764687 (Jan. 2010).
16. Dayhoff, J. & DeLeo, J. Artificial Neural Networks: Opening the Black Box. CANCER 91, 1615–1635 (2001).
17. de Kloet, E. From Vasotocin to Stress and Cognition. Eur J Pharmacol 626, 18–26 (2010).
18. de Magalhães, J. P., Finch, C. E. & Janssens, G. Next-Generation Sequencing in Aging Research: Emerging Applications, Problems, Pitfalls and Possible Solutions. Ageing Res Rev 9, 315– 323. issn: 1568-1637 (July 2010).
19. Ding, S., Su, C. & Yu, J. An Optimizing BP Neural Network Algorithm Based on Genetic Algorithm. Artif Intell Rev 36, 153–162 (2011).
20. Dunn, A., Swiergiel, A. & Phalamrchouk, V. Brain Circuits Involved in Corticotropin-ReleasingFactor-Norepinephrine Interactions during
Stress. Ann N Y Acad Sci 1018, 25–34 (2004).
21. Farooqui, A. A. & Horrocks, L. A. Plasmalogens: Workhorse Lipids of Membranes in Normal and Injured Neurons and Glia. eng. Neuroscientist 7, 232–245. issn: 1073-8584 (June 2001).
22. Fisher, S. E. et al. Sequence-Based Exon Prediction around the Synaptophysin Locus Reveals a Gene-Rich Area Containing Novel Genes in Human Proximal Xp. Genomics 45, 340–347. issn: 0888-7543 (Oct. 1997).
23. Gelfman, S. et al. Changes in Exon–intron Structure during Vertebrate Evolution Affect the Splicing Pattern of Exons. Genome Res 22, 35–50. issn: 1088-9051 (Jan. 2012).
24. Ghoshal, U. & Das, A. Models for Prediction of Mortality from Cirrhosis with Special Reference to Artificial Neural Network: A Critical Review. Hepatol Int 2, 31–38 (2008).
25. Halder, R. et al. DNA Methylation Changes in Plasticity Genes Accompany the Formation and Maintenance of Memory. en. Nat Neurosci 19, 102– 110. issn: 1097-6256 (Jan. 2016).
26. Happel, B. & Murre, J. The Design and Evolution of Modular Neural Network Architectures. Neural Networks 7, 985–1004 (1994).
27. Haykin, S. Neural Networks and Learning Machines 3rd. isbn: 0-13-147139-2 (Pearson, 2009).
28. Hegazy, T., Fazio, P. & Moselhi, O. Develop35. ing Practical Neural Network Applications Using Back-Propagation. English. MICE Computer-Aided
Civil and Infrastructure Engineering 9, 145–159.
issn: 1093-9687 (1994).
29. Hill, T., Marquez, L., O’Connor, M. & Remus, W. 36. Artificial Neural Network Models for Forecasting
and Decision Making. International Journal of Forecasting 10, 5–15 (1994).
30. Hindson, B. J. et al. High-Throughput Droplet 37. Digital PCR System for Absolute Quantitation of DNA Copy Number. eng. Anal. Chem. 83, 8604– 8610. issn: 1520-6882 (Nov. 2011).
31. Kabelik, D., Alix, V., Burford, E. & Singh, L. 38. Aggressionand Sex-Induced Neural Activity across Vasotocin Populations in the Brown Anole. Horm. Behav 63, 437–446 (2013).
32. Kabelik, D., Kelly, A. & Goodson, J. Dopaminergic Regulation of Mate Competition Aggression and 39. Aromatase-Fos Colocalization in Vasotocin Neurons. Neuropharmacology 58, 862–866 (2010).
33. Kabelik, D., Klatt, J., Kingsbury, M. & Goodson,
J. Endogenous Vasotocin Exerts ContextDe40. pendent Behavioral Effects in a Semi-Naturalistic Colony Environment. Horm. Behav 56, 101–107 (2009).
PhD Fellowship
34. Kabelik, D. & Magruder, D. Involvement of Different Mesotocin (Oxytocin Homologue) PopUlations in Sexual and Aggressive Behaviours of the Brown Anole. Biol. Lett 10 (2014).
35. Kabelik, D., Morrison, J. & Goodson, J. Cryptic Regulation of Vasotocin Neuronal Activity but Not Anatomy by Sex Steroids and Social Stimuli in Opportunistic Desert Finches. Brain Behav. Evol. 75, 71–84 (2010).
36. Kabelik, D., Schrock, S., Ayres, L. & Goodson, J. Estrogenic Regulation of Dopaminergic Neurons in the Opportunistically Breeding Zebra Finch. Gen. Comp. Endocrinol. 173, 96–104 (2011).
37. Kabelik, D. et al. Neural Activity in Catecholaminergic Populations Following Sexual and Aggressive Interactions in the Brown Anole, Anolis Sagrei. Brain Res. 58 (2014).
38. Kakaradov, B., Xiong, H. Y., Lee, L. J., Jojic, N. & Frey, B. J. Challenges in Estimating Percent Inclusion of Alternatively Spliced Junctions from RNASeq Data. BMC Bioinformatics 13, S11. issn: 14712105 (Apr. 2012).
39. Kamarthi, S. V. & Pittner, S. Accelerating Neural Network Training Using Weight Extrapolations. ENG. Neural Netw 12, 1285–1299. issn: 18792782 (Nov. 1999).
40. Kavzoglu, T. & Mather, P. The Role of Feature Selection in Artificial Neural Network Applications. Int. J. Remote Sensing 23, 2919–2937 (2002).
41. Kavzoglu, T. An Investigation of the Design and Use of Feed-Forward Artificial Neural Networks in the Classification of Remotely Sensed Image PhD (University of Nottingham, 2001
42. Korzan, W., Summers, T. & Summers, C. Monoaminergic Activities of Limbic Regions Are Elevated during Aggression: Influence of Sympathetic Social Signaling. Brain Res 870, 170–178 (2000).
43. Kövesdi, I. et al. Application of Neural Networks in Structure-Activity Relationships. English. MED Medicinal Research Reviews 19, 249–269. issn: 0198-6325 (1999).
44. Lanfumery, L., Mongeau, R., Cohen-Salmon, C. & Hamon, M. Corticosteroid-Serotonin Interactions in the Neurobiological Mechanisms of Stress-Related Disorders. Neurosci Biobehav Rev 32, 1174–1184 (2008).
45. Lee, C., Kim, N., Roy, M. & Graveley, B. R. Massive Expansions of Dscam Splicing Diversity via Staggered Homologous Recombination during Arthropod Evolution. eng. RNA 16, 91–105. issn: 1469-9001 (Jan. 2010).
46. Lee, Y. & Rio, D. C. Mechanisms and Regulation of Alternative Pre-mRNA Splicing. eng. Annu. Rev. Biochem. 84, 291–323. issn: 1545-4509 (2015).
47. Letunic, I., Copley, R. R. & Bork, P. Common Exon Duplication in Animals and Its Role in Alternative Splicing. eng. Hum. Mol. Genet. 11, 1561–1567. issn: 0964-6906 (June 2002).
48. Leung, M. K. K., Xiong, H. Y., Lee, L. J. & Frey, B. J. Deep Learning of the Tissue-Regulated Splicing Code. en. Bioinformatics 30, i121–i129. issn: 1367-4803, 1460-2059 (June 2014).
49. Libbrecht, M. W. & Noble, W. S. Machine Learning Applications in Genetics and Genomics. eng. Nat. Rev. Genet. 16, 321–332. issn: 1471-0064 (June 2015).
50. Lisboa, P. A Review of Evidence of Health Benefit from Artificial Neural Networks in Medical Intervention. English. Neural Networks Neural Networks 15, 11–39. issn: 0893-6080 (2002).
51. Love, T. et al. Oxytocin Gene Polymorphisms Influence Human Dopaminergic Function in a SexDependent Manner. Biol Psychiatry 72, 198–206 (2012).
52. MacLean, O. Why Brain Research on Lizards? Behavior and Neurology of Lizards, 110 (1978).
53. Macosko, E. Z. et al. Highly Parallel GenomeWide Expression Profiling of Individual Cells Using Nanoliter Droplets. English. Cell 161, 1202– 1214. issn: 0092-8674, 1097-4172 (May 2015).
54. Maier, H. & Dandy, G. Neural Networks for the Prediction and Forecasting of Water Resources Variables: A Review of Modelling Issues and Applications. Environmental Modelling & Software 15, 101–124 (2000).
55. Matlin, A. J., Clark, F. & Smith, C. W. J. Understanding Alternative Splicing: Towards a Cellular Code. eng. Nat. Rev. Mol. Cell Biol. 6, 386–398. issn: 1471-0072 (May 2005).
56. Mayr, J. A. et al. Deficiency of the Mitochondrial Phosphate Carrier Presenting as Myopathy and
Cardiomyopathy in a Family with Three Affected. Children. eng. Neuromuscul. Disord. 21, 803–808.
issn: 1873-2364 (Nov. 2011).
57. Meijers, R. et al. Structural Basis of Dscam Isoform Specificity. eng. Nature 449, 487–491. issn: 14764687 (Sept. 2007).
58. Nemajerova, A. et al. TAp73 Is a Central Transcriptional Regulator of Airway Multiciliogenesis. en. Genes Dev. issn: 0890-9369, 1549-5477. doi:10. 1101/gad.279836.116. (Visited on 09/29/2016). (June 2016).
59. Nilsen, T. W. & Graveley, B. R. Expansion of
the Eukaryotic Proteome by Alternative Splicing.
eng. Nature 463, 457–463. issn: 1476-4687 (Jan.
2010).
60. OConnell, L. & Hofmann, H. Evolution of a Vertebrate Social Decision-Making Network. Science 336, 1154–1157 (2012).
61. Ortin, S., Gutierrez, J., Pesquera, L. & Vasquez, H. Nonlinear Dynamics Extraction for Time-Delay. Systems Using Modular Neural Networks Synchronization and Prediction. Physica 351, 133–
141 (2005).
62. Pan, Q., Shai, O., Lee, L. J., Frey, B. J. & Blencowe,. B. J. Deep Surveying of Alternative Splicing Complexity in the Human Transcriptome by HighThroughput Sequencing. eng. Nat. Genet. 40, 1413–1415. issn: 1546-1718 (Dec. 2008).
63. Pillmann, H., Hatje, K., Odronitz, F., Hammesfahr, B. & Kollmar, M. Predicting Mutually Exclusive Spliced Exons Based on Exon Length, Splice Site and Reading Frame Conservation, and Exon Sequence Homology. eng. BMC Bioinformatics 12, 270. issn: 1471-2105 (2011).
64. Ramesh, A., Kambhampati, C., Monson, J. & Drew, P. Artificial Intellegence in Medicine. Ann R Coll Surg Engl 86, 334–338 (2004).
65. Rodvold, D., McLeod, D., Brandt, J., Snow, P. & Murphy, G. Introduction to Artificial Neural Networks for Physicians: Taking the Lid off the Black Box. The Prostate 46, 39–44 (2001).

66. Sakata, J., Coomber, P., Gonzalez-Lima, F. & Crews, D. Functional Connectivity among Limbic Brain Areas: Differential Effects of Incubation Temperature and Gonadal Sex in the Leopard Gecko, Eublepharis Macularius. Brain Behav. Evol. 55, 139–151 (2000).
67. Sakharkar, M. K., Chow, V. T. K. & Kangueane, P. Distributions of Exons and Introns in the Human Genome. eng. In Silico Biol. (Gedrukt) 4, 387–393. issn: 1386-6338 (2004).
68. Saruhan, I. et al. The Estimation of Adult and Nymph Stages of Aphis Fabae (Hemiptera: Aphididae) Using Artificial Neural Network. Entomological News 125, 12–19 (2015).
69. Schad, E., Kalmar, L. & Tompa, P. Exon-Phase Symmetry and Intrinsic Structural Disorder Promote Modular Evolution in the Human Genome. Nucleic Acids Res 41, 4409–4422. issn: 0305-1048 (Apr. 2013).
70. Schmucker, D. et al. Drosophila Dscam Is an Axon Guidance Receptor Exhibiting Extraordinary Molecular Diversity. eng. Cell 101, 671–684. issn: 0092-8674 (June 2000).
71. Shen, H. et al. Coupling between Endocytosis and Sphingosine Kinase 1 Recruitment. Nature cell biology 16, 652–662 (2014).
72. Smeets, W. & Gonzalez, A. Catecholamine Systems in the Brain of Vertebrates: New PerspecTives through a Comparative Approach. Brain Res. Rev. 33, 308–379 (2000).
73. Smith, A. & Wang, Z. Salubrious Effects of Oxytocin on Social Stress-Induced Deficits. Horm. Behav 61, 320–330 (2012).
74. Splawski, I. et al. Ca(V)1.2 Calcium Channel Dysfunction Causes a Multisystem Disorder Including Arrhythmia and Autism. eng. Cell 119, 19–31. issn: 0092-8674 (Oct. 2004).
75. Splawski, I. et al. Severe Arrhythmia Disorder Caused by Cardiac L-Type Calcium Channel Mutations. eng. Proc. Natl. Acad. Sci. U.S.A. 102, 8089– 8096, discussion 8086–8088. issn: 0027-8424 (June 2005).
76. Stilling, R. M. et al. De-Regulation of Gene Expression and Alternative Splicing Affects Distinct Cellular Pathways in the Aging Hippocampus. Front Cell Neurosci 8. issn: 1662-5102. doi:10 . 3389 / fncel . 2014 . 00373. (Visited on 09/29/2016) (Nov. 2014).
77. Summers, C. Mechanisms for Quick and Variable Responses. Brain Behav. Evol. 57, 283–292 (2001).
78. Suyama, M. Mechanistic Insights into Mutually Exclusive Splicing in Dynamin 1. en. Bioinformatics 29, 2084–2087. issn: 1367-4803, 1460-2059 (Jan. 2013).
79. Trainor, B. Stress Responses and the Mesolimbic Dopamine System: Social Contexts and Sex Differences. Horm. Behav 60, 457–469 (2011).
80. Vaidyanathan, P. P. & Yoon, B.-j. Gene And Exon Prediction Using Allpass-Based Filters (2002).
81. Wade, J. Relationships among Hormones, Brain and Motivated Behaviors in Lizards. Horm. Behav 59, 637–644 (2011).
82. Wang, E. T. et al. Alternative Isoform Regulation in Human Tissue Transcriptomes. eng. Nature 456, 470–476. issn: 1476-4687 (Nov. 2008).
83. Wang, Y. The Theoretical Framework of Cognitive Informatics. Int’l Jrnl of Cog Info and Nat Intel 1, 1– 27 (2007).
84. Wang, Z., Gerstein, M. & Snyder, M. RNA-Seq: A Revolutionary Tool for Transcriptomics. eng. Nat. Rev. Genet. 10, 57–63. issn: 1471-0064 (Jan. 2009).
85. Wong, D. et al. Epinephrine: A Shortand Long-
Term Regulator of Stress and Development of Illness : A Potential New Role for Epinephrine in Stress. Cell Mol Neurobiol 32, 737–748 (2012).
86. Woolfe, A., Mullikin, J. C. & Elnitski, L. Genomic Features Defining Exonic Variants that Modulate Splicing. Genome Biol 11, R20. issn: 1465-6906 (2010).
87. Xiong, H. Y., Barash, Y. & Frey, B. J. Bayesian Prediction of Tissue-Regulated Splicing Using RNA Sequence and Cellular Context. eng. Bioinformatics 27, 2554–2562. issn: 1367-4811 (Sept. 2011).
88. Xiong, H. Y. et al. The Human Splicing Code Reveals New Insights into the Genetic Determinants of Disease. en. Science 347, 1254806. issn: 0036-8075, 1095-9203 (Jan. 2015).
89. Yang, E.-J. & Wilczynski, W. Social Experience Organizes Parallel Networks in Sensory and Limbic Forebrain. Dev. Neurobiol. 67, 285–393 (2007).
90. Yilmaz, I. & Kaynar, O. Multiple Regression, ANN (RBF, MLP) and ANFIS Models for Prediction of Swell Potential of Clayey Soils. Expert Systems with Applications 38, 5958–5966. issn: 0957-4174 (May 2011).
91. Zhang, F. & Lupski, J. R. Non-Coding Genetic Variants in Human Disease. eng. Hum. Mol. Genet. 24, R102–110. issn: 1460-2083 (Oct. 2015).
92. Zhao, S., Fung-Leung, W.-P., Bittner, A., Ngo, K. & Liu, X. Comparison of RNA-Seq and Microarray in Transcriptome Profiling of Activated T Cells. PLOS ONE 9, e78644. issn: 1932-6203 (Jan. 2014).
93. Zhu, S., Wang, G., Liu, B. & Wang, Y. Modeling Exon Expression Using Histone Modifications. PLoS One 8. issn: 1932-6203. doi:10.1371/journal. pone . 0067448. (Visited on 09/29/2016) (June 2013).



[fig2.1]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/1.png
[fig2.2]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/2.png
[fig2.3]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/3.png
[fig2.4]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/4.png
[fig2.5]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/5.png
[fig2.6]:https://github.com/SumNeuron/WolframSummerSchool2017Magruder/blob/master/about/imgs/6.png
