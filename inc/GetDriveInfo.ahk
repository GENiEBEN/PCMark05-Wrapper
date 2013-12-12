DriveGet, list, list ;Get a list of all drive letters

Loop, parse, list ;parse thru drive letters
{
	path = %A_LoopField%:\
	drive:=substr(path,1,2)

	;Open Volume
	hJRoot:=dllCall("CreateFile", "wstr","\\.\" drive, "uint",0xC0000000, "uint",3, "uint",0, "uint",3, "uint",FILE_FLAG_SEQUENTIAL_SCAN:=0x08000000, "uint",0)

	;open USN journal
	VarSetCapacity(cujd,16)
	numput(0x800000,cujd,0,"uint64")
	numput(0x100000,cujd,8,"uint64")
	ok:=dllCall("DeviceIoControl", "uint",hJRoot, "uint",FSCTL_CREATE_USN_JOURNAL:=0x000900e7, "uint",&cujd, "uint",16, "uint",0, "uint",0, "uintp",cb, "uint",0)
	if( ok=0 )
	{
	dllCall("CloseHandle", "uint",hJRoot)
	return
	}

	VarSetCapacity(voldata,96,0) ;create buffer 96bytes

	if( dllCall("DeviceIoControl", "uint",hJRoot, "uint",FSCTL_GET_NTFS_VOLUME_DATA:=0x00090064, "uint",0, "uint",0, "uint",&voldata, "uint",96, "uintp",cb, "uint",0) && cb=96 )
	{
		hdd_SerialNumber:=numget(voldata,0,"uint")
		hdd_NumberSectors:=numget(voldata,8,"uint")
		hdd_TotalClusters:=numget(voldata,16,"uint")
		hdd_FreeClusters:=numget(voldata,24,"uint")
		hdd_TotalReserved:=numget(voldata,32,"uint")
		hdd_SectorSize:=numget(voldata,40,"uint")
		hdd_ClusterSize:=numget(voldata,44,"uint")
		hdd_BytesPerFile:=numget(voldata,48,"uint")
		hdd_ClusterPerFile:=numget(voldata,52,"uint")
		hdd_MftValidDataLen:=numget(voldata,56,"uint")
		hdd_MftStartLcn:=numget(voldata,64,"uint")
		hdd_Mft2StartLcn:=numget(voldata,72,"uint")
		hdd_MftZoneStart:=numget(voldata,80,"uint")
		hdd_MftZoneEnd:=numget(voldata,88,"uint")
	}
		If hdd_SectorSize > 512
		{
		break
		}
}