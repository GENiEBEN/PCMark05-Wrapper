;-------------------------------------------------------------------------------------------------------------
;START
WinWait, %MUI_999%, %MUI_997%							;Wait for MT2 subtest window
;-------------------------------------------------------------------------------------------------------------
;VERIFY FOR LOCAL RICHED20.DLL
path = %PCM05Path%\riched20.dll							;path to check
hash := Crypt.Hash.FileHash(path,1,1)					;Generate MD5+RC4

	;Genieben Riched20.dll found
	IfInString, hash, %HASH_002%
	{
		log = %log%`n%MUI_001%
	} 
	;Unknown Riched20.dll found
	else {
		log = %log%`n%MUI_002%
	}
	
;Abort if error 'Benchmark aborted' is shown by PCMark05.
WinWait, PCMark05, %MUI_995% , 10							;Only wait 10 seconds
if ErrorLevel												;'Benchmark aborted' not found
{
	WinWait, %MUI_999%, %MUI_998%							;Wait for the window to say 'Deinit'
} else {													;'Benchmark aborted' found
    send, {Enter}											;Press OK
	MsgBox, 48, Error 2, %ERR_002%, 20						;Warn User
	Process, Close, PCMark05.exe							;KILL PCMark
	ExitApp													;KILL Wrapper
}
;-------------------------------------------------------------------------------------------------------------
;WAIT FOR SUBTEST TO END
WinWait, %MUI_999%, %MUI_998%							;Wait for the window to say 'Deinit'
	;Pause process, MATRIX stuff...
    WinGet PID, PID, A									;Get Process ID
	SetFormat Integer, H								;Store it in HEX format
	PID +=0												
	SetFormat Integer, D								;Store it in DEC format
	ProcSus(PID)										;Pause process
;-------------------------------------------------------------------------------------------------------------	
;VERIFY TEST.RTF FILE
	path = %PCM05Path%\_tmpDir1\wordpad\test.rtf
	hash := Crypt.Hash.FileHash(path,1, 1)				;Generate MD5+RC4
	IfInString, hash, %HASH_001%						;Verify hash
	{

	} else {											;Dirty bastard hacked the file
		log = %log%`n%MUI_003%										
	}
	;Resume process, MATRIX cheated :)
	ProcRes(PID) 
;-------------------------------------------------------------------------------------------------------------
;EXIT
AllTestWereMonitored = 1
GoSub, Splash