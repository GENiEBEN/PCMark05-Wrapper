;-------------------------------------------------------------------------------------------------------------
;START
WinWait, %MUI_999%, %MUI_996%						;Wait for XP startup window
#Include GetDriveInfo.ahk							;Get sector size
WinWait, %MUI_999%, %MUI_998%						;Subtest is finished

If Rule_SectorSize512=1
{
	If hdd_SectorSize = 512								;Only 512 is allowed per HWBOT rules
	{
	log = %log%`n%MUI_004%								;Update log with OK
	} else {
	log = %log%`n%MUI_005% %hdd_SectorSize% %MUI_008%	;Update log with BAD
	}
}
;Abort if error 'Benchmark aborted' is shown by PCMark05.
WinWait, PCMark05, %MUI_995% , 5						;Only wait 5 seconds
if ErrorLevel											;'Benchmark aborted' not found
{
} else {												;'Benchmark aborted' found
    send, {Enter}										;Press OK
	MsgBox, 48, Error 2, %ERR_002%, 20					;Warn User
	Process, Close, PCMark05.exe						;KILL PCMark
	ExitApp												;KILL Wrapper
}
;-------------------------------------------------------------------------------------------------------------
;EXIT
Progress, Off										;Hide Splash screen because next test is 3D