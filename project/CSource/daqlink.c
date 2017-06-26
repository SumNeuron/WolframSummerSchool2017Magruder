
#include "WolframLibrary.h" //for librarylink


#include <NIDAQmx.h> // for the daq api functions



EXTERN_C DLLEXPORT int CreateTask(WolframLibraryData libData, mint argc, MArgument* args, MArgument res)
{
	//get the name string as the name to use from the first argument
	char * nameString = MArgument_getUTF8String(args[0]);

	//allocate a task here
	TaskHandle * task = (TaskHandle *)calloc(1,sizeof(TaskHandle));

	//create the task with the api function from daq
	int error = DAQmxCreateTask(nameString,task);
	if(error != 0)
	{
		//error - failed
		return LIBRARY_FUNCTION_ERROR;
	}

	//success
	return LIBRARY_NO_ERROR;
}


EXTERN_C DLLEXPORT int LoadTask(WolframLibraryData libData, mint argc, MArgument* args, MArgument res)
{
	//get the name string as the name to use from the first argument
	char * nameString = MArgument_getUTF8String(args[0]);

	//allocate a task here
	TaskHandle * task = (TaskHandle *)calloc(1,sizeof(TaskHandle));

	//create the task with the api function from daq
	int error = DAQmxLoadTask(nameString,task);
	if(error != 0)
	{
		//error - failed
		return LIBRARY_FUNCTION_ERROR;
	}

	//success
	return LIBRARY_NO_ERROR;
}