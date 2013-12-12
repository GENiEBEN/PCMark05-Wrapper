ProcSus(PID_or_Name) 

{ 

   If InStr(PID_or_Name, ".") { 

      Process, Exist, %PID_or_Name% 

      PID_or_Name := ErrorLevel 

   } 

   If !(h := DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", PID_or_Name)) 

      Return -1 

   DllCall("ntdll.dll\NtSuspendProcess", "Int", h), DllCall("CloseHandle", "Int", h) 

} 



ProcRes(PID_or_Name) 

{ 

   If InStr(PID_or_Name, ".") { 

      Process, Exist, %PID_or_Name% 

      PID_or_Name := ErrorLevel 

   } 

   If !(h := DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", PID_or_Name)) 

      Return -1 

   DllCall("ntdll.dll\NtResumeProcess", "Int", h), DllCall("CloseHandle", "Int", h) 

}