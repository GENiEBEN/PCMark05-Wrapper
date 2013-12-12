	xout = %xout%<SysInfo>`n
	EnvGet, CPUArch, PROCESSOR_ARCHITECTURE
	xout = %xout%<CPUArch>%CPUArch%</CPUArch>`n
	;
	EnvGet, CPUCores, NUMBER_OF_PROCESSORS
	xout = %xout%<CPUCores>%CPUCores%</CPUCores>`n
	;
	EnvGet, CPUIdent, PROCESSOR_IDENTIFIER
	xout = %xout%<CPUID>%CPUIdent%</CPUID>`n
	;
	EnvGet, OSKernel, OS
	xout = %xout%<OSKernel>%OSKernel%</OSKernel>`n
	;
	xout = %xout%<OS>%A_OSVersion%</OS>`n
	;
	If A_Is64bitOS = 0
	{
	xout = %xout%<SysType>x86</SysType>`n ;32bit Windows
	}
	else
	{
	xout = %xout%<SysType>x64</SysType>`n ;64bit Windows
	}
	;
	DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UIntP, OrigMouseSpeed, UInt, 0)
	xout = %xout%<MouseSpeed>%OrigMouseSpeed%</MouseSpeed>`n
