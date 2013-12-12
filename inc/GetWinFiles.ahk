;Loops thru some Windows files

;List of files to read, separate items with an /
FileList =riched20.dll/riched32.dll/ieframe.dll
;Get System folder path
SysDir = %A_WinDir%\System32
If (A_Is64bitOS = 1) ;64bit Win
	SysDir = %A_WinDir%\SysWOW64
;Loop thru some predefined files
Loop, parse, FileList, /
{
	FileGetVersion, DLLversion, %SysDir%\%A_LoopField%
	If DLLversion = 
	{
	DLLversion = 0.0.0.0
	}
   tmpCurDLL = %A_LoopField%
   StringSplit, word_array, tmpCurDLL , .  ; Omits periods.
   xout = %xout%<FILE_%word_array1%>`n
   xout = %xout%<Name>%A_LoopField%</Name>`n
   FileGetSize,b, %SysDir%\%A_LoopField%
   xout = %xout%<Size>%b%</Size>`n
   xout = %xout%<Version>%DLLversion%</Version>`n
   FileGetAttrib, b, %SysDir%\%A_LoopField%	   
   xout = %xout%<Attributes>%b%</Attributes>`n  	
   path = %SysDir%\%A_LoopField%
   hash := Crypt.Hash.FileHash(path,6, password,7) ; get a HMAC SHA_512 HASH of file using password and AES_256 encryption key
   xout = %xout%<Hash>%hash%</Hash>`n	
   
	if tmpCurDLL = riched20.dll
	{
		StringSplit, word_array, tmpCurDLL , .  
		;Genieben Riched20.dll found
		if hash=2671d93543c383d9d07781145bc6d208e6fbcf47879baf9eb70bed4797f89d86dc63180883f6b351ff88e9407a1e8bf21222423a827d3f8115c8e6479671ae63
		{
			xout = %xout%<Status>OK</Status>`n
			log = %log%`nGENiEBEN RichEdit control found.
		}
		xout = %xout%</FILE_%word_array1%>`n
	}
}
   
