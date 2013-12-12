;Returns path of PCMark05 folder.
	If A_Is64bitOS = 0 ;32bit Win
	{
	RegRead, PCM05Path, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},InstallLocation
	RegPath = SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1}
	}
	else ;64bit Win
	{
	RegRead, PCM05Path, HKLM, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},InstallLocation
	RegPath = SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1}
	} ;It's not where registry says, so assume it's in ProgramFiles
    IfNotExist, %PCM05Path%\PCMark05.exe { PCM05Path = %ProgramFiles%\Futuremark\PCMark05 }
    xout = %xout%<PCMPath>%PCM05Path%</PCMPath>`n

;-------------------------------------------------------------------------------------------------------------
;Check what version of PCMark05 is installed.
	If A_Is64bitOS = 0 ;32bit Win
	{
	RegRead, PCM05Version, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},DisplayVersion
	}
	Else ;64bit Win
	{
	RegRead, PCM05Version, HKLM, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},DisplayVersion
	}
    If PCM05Version = %LatestPCMversion% ;1.2.2 is latest available at this time (OCT.2012)
  	{
	xout = %xout%<PCMVersion>%PCM05Version%</PCMVersion>`n<WrapperVersion>%WrapperVersion%</WrapperVersion>`n
  	}
  Else 
	{ 
	log = %log%`nNot using PCMark05 version %LatestPCMversion%
	DealBreaker = 1
	xout = %xout%<PCMVersion>NOT USING LATEST VERSION</PCMVersion>`n<WrapperVersion>%WrapperVersion%</WrapperVersion>`n
	}

;-------------------------------------------------------------------------------------------------------------
;Check in what language is installed (Wrapper only supports ENGLISH 0x09)
	If A_Is64bitOS = 0 ;32bit Win
	{
	RegRead, PCM05Lang, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},Language
	}
	Else ;64bit Win
	{
	RegRead, PCM05Lang, HKLM, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{5C104E56-A441-429D-A609-D8A46EB92EA1},Language
	}
	xout = %xout%<PCMLang>%PCM05Lang%</PCMLang>`n
	xout = %xout%</SysInfo>`n
