DEBUGMODE = 0											;Must be 0 in retail version
;------------------------------------------------------------------------------------------------------------
;START
	Progress, Off										;Hide Wrapper's splash screen

;WinWait, %MUI_999%, %MUI_991%							;Wait for 2D Transparent subtest window
;-------------------------------------------------------------------------------------------------------------
;FLASHDESKTOP

;COM METHOD

If Rule_FlashDesktop=1									;Is FlashDesktop rule ON?
{														
	for process in ComObjGet("winmgmts:")
	.ExecQuery("Select * from Win32_Process") 			;Get a list of processes using COM
	{
		COMList = % process.Commandline					;Retrieve process' commandline
		SplitPath, COMList,, dir						;Extract path from commandling
		Char34 := Chr(34)								;Define character: "
		StringReplace, dir, dir, %Char34%, , All		;Replace all " found in path
		FDHooks= %dir%\%MUI_989%						;Full path of FDHooks.dll
		If (FileExist(FDHooks)) 						;FDHooks.dll exists
		{
			COMName = % process.Name					;get name of the process using this file
			Process, Close, %COMName%					;Kill process
		}
	}
}
;-------------------------------------------------------------------------------------------------------------
WinWait, PCMark05, 										;Wait for the Fullscreen 2D Transparent Window

If A_ScreenWidth =1024									;Check if run at default screen resolution
{
	If A_ScreenHeight=768
	{
		;Resolution is OK
		log = %log%`n2D TW @ %A_ScreenWidth%x%A_ScreenHeight% (OK)
	} else {
		;HEIGHT not default
		log = %log%`n2D TW @ %A_ScreenWidth%x%A_ScreenHeight% (BAD)
	}
} else {
	;WIDTH not default
	log = %log%`n2D TW @ %A_ScreenWidth%x%A_ScreenHeight% (BAD)
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
