;-------------------------------------------------------------------------------------------------------------
;START
WinWait, %MUI_999%, %MUI_993%							;Wait for Physics & 3D subtest window
;-------------------------------------------------------------------------------------------------------------
WinWait, %MUI_992%										;Wait for the Fullscreen 3D Window

If A_ScreenWidth =1024									;Check if run at default screen resolution
{
	if A_ScreenHeight=768
	{
		;Resolution is OK
		log = %log%`n3D Pixel & Shader @ %A_ScreenWidth%x%A_ScreenHeight% (OK)	
	} else {
		;HEIGHT not default
		log = %log%`n3D Pixel & Shader @ %A_ScreenWidth%x%A_ScreenHeight% (BAD)
	}
} else {
	;WIDTH not default
	log = %log%`n3D Pixel & Shader @ %A_ScreenWidth%x%A_ScreenHeight% (BAD)	
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
;EXIT
GoSub, Splash
