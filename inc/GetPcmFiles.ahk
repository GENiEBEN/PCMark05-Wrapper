DEBUGMODE=1														;If 0 then retail, else some errors will be skipped
;-------------------------------------------------------------------------------------------------------------
FileList =2D_Test.dll/3D_Test.dll/ogg.dll/vorbis.dll/vorbisenc.dll/vorbisfile.dll
;Loop thru some predefined files
Loop, parse, FileList, /
{
	StringSplit, word_array, A_LoopField, .  					;Get filename without extension
;-------------------------------------------------------------------------------------------------------------
;Get File Info and store it
   path = %PCM05Path%\%A_LoopField%								;Get path of currently checked file
   hash := Crypt.Hash.FileHash(path,1,1) 						;Generate MD5+RC4					;
;-------------------------------------------------------------------------------------------------------------   
;VERIFY INTEGRITY OF FILES
	If hash in %HASH_001%,%HASH_002%,%HASH_003%,%HASH_004%,%HASH_005%,%HASH_006%,%HASH_007%,%HASH_008%,%HASH_008b%,%HASH_009%,%HASH_010%,%HASH_011%,%HASH_012%,%HASH_013%,%HASH_014%,%HASH_015%,%HASH_016%,%HASH_017%,%HASH_018%,%HASH_019%,%HASH_020%,%HASH_021%,%HASH_022%,%HASH_023%,%HASH_024%					
	{
		xout =%xout%<FILE_%word_array1%>OK</FILE_%word_array1%>`n
	} else {
		If DEBUGMODE=0
		{
			MsgBox, 48, Error 1, %ERR_003%, 20
			Process, Close, PCMark05.exe
			ExitApp
		} else {
		xout =%xout%<FILE_%word_array1%>BAD</FILE_%word_array1%>`n
		}
	}
}