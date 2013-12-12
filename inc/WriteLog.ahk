;Writes the wrapper log file to disk
  FileDelete, %PCM05Path%\wrapper.xml						;Delete previous file
  FileAppend, %xout%`n%Timeline%</Timeline>`n</root>`n , %PCM05Path%\wrapper.xml 	;Write new file
