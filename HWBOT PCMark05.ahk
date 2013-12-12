;=============================================================================================================
; Compiler/Lang	: AutoHotkey_L v1.0.92+
; Language		: English
; Platform		: Win
; Author		: El Genieben (codinx@gmail.com)
; Description	: Anti-cheat wrapper for PCMark05 @ HWBOT.org
; 3rd Parties	: c-labeled functions by Laszlo: http://www.autohotkey.com/forum/topic17058.html
;
;-------------------------------------------------------------------------------------------------------------
#SingleInstance force 					;Prevents launching the wrapper multiple times by accident.
#NoEnv  								;Recommended for performance and compatibility with future AutoHotkey releases.
;#NoTrayIcon 							;Hides the wrapper from System Tray.
SendMode Input  						;Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  			;Ensure consistent starting directory so that any UE-specific syntax files can found.
#Include lib\Crypt.ahk 					;Crypyo library.
#Include lib\CryptConst.ahk 			;Crypyo library.
#Include lib\CryptFoos.ahk 				;Crypyo library.
#Include lib\ScreenMeasure.ahk			;Get Screen coordinates
#Include lib\Calc.ahk					;Calc library (math operations on string text)
#Include inc\Const.ahk					;Constants
#Include lib\Process.ahk				;Functions for Pausing/Resuming processes.
;=============================================================================================================

;=============================================================================================================
; START
#Include inc\CheckCompat.ahk		;Check if script can run on current OS and if user is Admin.
GoSub, Splash					;Show Splash window
#Include inc\GetScreenSize.ahk	;Retrieves Workarea size
#include inc\GetSysInfo.ahk		;Retrieve some Hardware and OS info
#Include inc\GetPcmInfo.ahk		;Retrieve some PCMark05 info from registry
#Include inc\GetPcmFiles.ahk		;Loop through all (exe/dat/dll) installation files and record details such as version/size/hash etc.
#Include inc\GetWinFiles.ahk		;Loop through some Windows files and record details (ie. riched.dll, ieframe.dll, dwm.exe etc)
GoSub, Splash					;Refresh Splash window with the bad tweaks found
#Include inc\StartPcm.ahk		;Runs pcmark05.exe (must be started only after we loaded information)
;#Include inc\MonitorXPStart.ahk	;Wait for HDD XP - Startup test
;#Include inc\MonitorPhysx3D.ahk	;Wait for Physics and 3D test
#Include inc\MonitorTW.ahk		;Wait for Transparent Windows test
;#Include inc\MonitorPixel.ahk	;Wait for 3D Pixel shader test
;#Include inc\MonitorWPR.ahk		;Wait for Web page rendering test
;#Include inc\MonitorFileDec.ahk	;Wait for File Decryption test
;#Include inc\Monitor2DMem.ahk	;Wait for 2D Graphics Memory test
;#Include inc\MonitorHDDGU.ahk	;Wait for HDD General Usage test
;#Include inc\MonitorMT1.ahk		;Wait for Multithreaded Test 1 test (Audio | Video)
;#Include inc\MonitorMT2.ahk		;Wait for Multithreaded Test 2 (Text Edit | Image Compression)
;#Include inc\MonitorMT3.ahk		;Wait for Multithreaded Test 3
;#Include inc\FinalDecision.ahk	;Take the final decision (score Ok or Not)
#Include inc\WriteLog.ahk		;Writes the wrapper log file to disk.
return
;=============================================================================================================

;=============================================================================================================
; SPLASH SCREEN
Splash:
	Progress, m2 b fs10 fm16 cwFFFFFF ct000000 zh0, (c) 2012 GENiEBEN, HWBOT PCMark05 %WrapperVersion%, PCM05W, Arial
	l := GetScreenLeft()
	t := GetScreenTop()
	WinMove, PCM05W, ,l , t				; Move Splash Screen in TOP LEFT corner
	WinSet, ExStyle, ^0x80, PCM05W  	; WS_EX_TOOLWINDOW, removes/adds the window from the alt-tab list.
	;WinSet, TransColor, FFFFFF , PCM05W 	; Make background color transparent.
return
;Hide Splash Window
#+h:: ;WinKey+Shift+H
	Progress, Off
return
;-------------------------------------------------------------------------------------------------------------
;Show Splash Window.
#+s:: ;WinKey+Shift+S
	GoSub, Splash
return
;=============================================================================================================

;=============================================================================================================
; EXIT
#x:: ;WinKey+x
	GoSub, ExitSteps  ; Reverse any modifications done to system etc.
return
; ------------------------------------------------------------------------------------------------------------
ExitSteps:
	Progress, Off
	MsgBox, 16, HWBOT PCMark05,Thank you for playing fair.`nPayPal: codinx@gmail.com`n`n(c)2012 GENiEBEN
	ExitApp
return
;=============================================================================================================