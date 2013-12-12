;-------------------------------------------------------------------------------------------------------------
;START
WinWait, %MUI_999%, %MUI_994%							;Wait for MT1 subtest window
;-------------------------------------------------------------------------------------------------------------
;WAIT FOR SUBTEST TO END
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

WinWait, %MUI_999%, %MUI_998%							;Wait for the window to say 'Deinit'
	;Pause process, MATRIX stuff...
    WinGet PID, PID, A									;Get Process ID
	SetFormat Integer, H								;Store it in HEX format
	PID +=0												
	SetFormat Integer, D								;Store it in DEC format
	ProcSus(PID)										;Pause process
;-------------------------------------------------------------------------------------------------------------	
;VERIFY CODECS
;List of files to read, separate items with an /
FileList =ogg.dll/vorbis.dll/vorbisenc.dll/vorbisfile.dll
;Loop thru some predefined files
Loop, parse, FileList, /
{
   path = %PCM05Path%\%A_LoopField%
   hash := Crypt.Hash.FileHash(path,1,1) 				;generate MD5+RC4
   	
	If hash in %HASH_003%,%HASH_004%,%HASH_005%,%HASH_006%
	{
	} else {
			log = %log%`n%MUI_006%						;invalid audio codec found
			DealBreaker=1								;make final score invalid
	}
}
	;Resume process, MATRIX cheated :)
	ProcRes(PID) 
;-------------------------------------------------------------------------------------------------------------
;EXIT
GoSub, Splash