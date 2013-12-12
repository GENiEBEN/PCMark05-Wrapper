DEBUGMODE =1
;-------------------------------------------------------------------------------------------------------------
;START
Process, Close, PCMark05.exe		;Close PCMark05 if already opened
sleep, 1000							;Wait 1second in case it takes time to close PCMark
If DEBUGMODE=1
{
Run %PCM05Path%\PCMark05.exe -nosysteminfo		;Start PCMark05 without SystemInfo
} else {
Run %PCM05Path%\PCMark05.exe		;Start PCMark05 with SystemInfo
}

;WinWait PCMark05  					;Waits for PCMark Splash Screen
;WinGet, active_id, ID, A			;Gets PCMark Splash Screen handle ID
;WinHide, ahk_id %active_id%		;Hide PCMark Splash Screen
WinWait, PCMark05, CPU Score		;Wait for PCMark Main Window

;Ignore the message that says to close On Top applications (wrapper is one of them)
IfWinExist, PCMark05, stay on top
	send, {Enter}
	
;Delay things a little to avoid missing the next window
sleep, 100

;Abort if Visual Settings are not default.
IfwinExist, PCMark05, Visual
{
	send, {Enter}
	MsgBox, 48, Error 1, %ERR_001%, 20
	;Process, Close, PCMark05.exe
	;ExitApp
}

;Delay things a little to avoid missing the next window
sleep, 100

;Close any other message and start Benchmark
loop
{
IfWinActive, PCMark05, CPU Score
{
		;send, {Enter}					;Press START button
		;WinHide, PCMark05, CPU Score	;Hide Main Window
		break
} else {
;A PCMark message is still active,so close it
	IfWinActive, PCMark05
	{
		send, {Enter}
		sleep, 100
	}
}
}
