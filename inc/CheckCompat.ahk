;Run commands as Admin if we're not one.
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
}
;Are we trying to run this on ancient OS?
if A_OSVersion in WIN_NT4,WIN_95,WIN_98,WIN_ME,WIN_2000  ; Note: No spaces around commas.
{
MsgBox, %MUI_987%
ExitApp
}
;