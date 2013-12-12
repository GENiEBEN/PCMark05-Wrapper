;-------------------------------------------------------------------------------------------------------------
WrapperVersion = 1.05						;The version of this application/script.
LatestPCMversion = 1.2.2					;Valid scores must use this PCM05 version.
Monitor = 									;Leave empty for default monitor
xout = <?xml version="1.0" ?>`n<root>`n 	;Used to store a log in memory untill it's time to export it.
log = 										;Used to store the final text displayed in screenshot window.
Timeline = <Timeline>`n 					;Used to store timestamps on what the wrapper has been doing.
DealBreaker = 0 							;If this is set to 1 then the final score is declared INVALID.
OrigMouseSpeed =							;Will be used to store the Windows setting for Mouse Speed
AllTestWereMonitored = 0					;If this is set to 1 then all subtests were monitored.
;-------------------------------------------------------------------------------------------------------------
;ENABLE/DISABLE RULES 1=ENABLED 0=DISABLED
Rule_FlashDesktop=1							;Allow/disallow FlashDesktop
Rule_SectorSize512=1						;Only allow 512b Sector Size
;-------------------------------------------------------------------------------------------------------------
;HASHES
HASH_001 = dd64a8740586e8df2872560797f18ce5 ;default PCMark05 test.rtf file
HASH_002 = 46611bc4c4e560f7dcc85f0a70bb6340 ;GENiEBEN riched20.dll v1.0.0.0
HASH_003 = 817c0e0900edb9263b693aff212904a1 ;default ogg.dll
HASH_004 = 199d242bea1cc19fa004a7fa0ab26a59 ;default vorbis.dll
HASH_005 = f08106da33cb09b5138e4cca67be20ca ;default vorbisenc.dll
HASH_006 = 9973991a17e1b813c39fb72349c37bde ;default vorbisfile.dll
HASH_007 = 54a58bc4f9e21a304ac6c30cb9e8201d ;default 2D_Test.dll
HASH_008 = b46d81f3d5c7c86ec605802606b48985 ;default 3D_Test.dll
HASH_008b = 0a5ab2849cf467518fb148e895f486a8 ;default 3D_Test.dll FOR SOME REASON PCM CHANGES THIS FILE SOMETIMES
HASH_008 = be9beca91f4d5667caf9fedc3416510c ;default CPU_Test.dll
HASH_009 = 9173b3ffc2064aac90f172cf7049d2e7 ;default data.dat
HASH_010 = adfbd07508e7dd646cd0cf3f31b36615 ;default data2.dat
HASH_011 = 447cd19ae9fc856176bb19912ac3badd ;default data3D.dat
HASH_012 = 345487f26eb2c882e7023660f84fb2f3 ;default Exporter.dll
HASH_013 = cfc873376118991576188dd7a90f8261 ;default FMPad.exe
HASH_014 = a254399c7d86a50d06964cd8d8caba82 ;default FMSystem.dll
HASH_015 = 13ecf4bc9f405708dba714eaa6d47610 ;default iijl15.dll
HASH_016 = 17567ae118890e24843a70fcfb0d25a5 ;default libmmd.dll
HASH_017 = f301a75a1403f87b4cb8c77ce1fb8650 ;default MFC71.dll
HASH_018 = e26a9a9b8c0047b8cce025bce31a0188 ;default ogg.dll
HASH_019 = 28bcf3325a580f21afb10c523543cf92 ;default PCMark05.exe
HASH_020 = f3ca777cbdbd6aaad06a779ce312c99f ;default Phys_Test.dll
HASH_021 = 26c9de4a4ae52b8d142d42a68c426422 ;default RankPart.dll
HASH_022 = 84bf1275037e5b4667a2b364fa78719a ;default SI3.dll
HASH_023 = 762618f8e7cb1688d5c17a41472b541f ;default sponsored.dat
HASH_024 = 696dd3d3854ac0d70be0713dcc3a86cc ;default zlib1.dll
HASH_025 = 353f7879dc7a691e5c2f206f94ec320f ;ZLIB 1.2.7 zlib1.dll
HASH_026 = 5cd67cff4455a2c21eff0a72d9900dde ;ZLIB 1.2.5 zlib1.dll
HASH_027 = 7175ea5caf9b27589e8dc12f15d55979 ;ZLIB 1.2.3 zlib1.dll
;-------------------------------------------------------------------------------------------------------------
;ERRORS
ERR_001 = In order to run all the tests properly, Visual Settings need to be set to "Adjust for best appearance" and the "Classic Style" may not be selected (see PCMark05 help - usage section for instructions).
ERR_002 = Benchmark aborted, restart it!
ERR_003 = Modified PCMark file found!`nBenchmark will now close.
ERR_004 = FlashDesktop was detected and it will be closed!
;-------------------------------------------------------------------------------------------------------------
;MUI
MUI_999 = Running ;don't translate
MUI_998 = Deinit ;don't translate
MUI_997 = Text edit ;don't translate
MUI_996 = HDD - XP ;don't translate
MUI_995 = Benchmark aborted ;don't translate
MUI_994 = Audio ;don't translate
MUI_993 = Physics ;don't translate
MUI_992 = AppWindow	;the title of the Physx & 3D window
MUI_991 = Transparent ;don't translate
MUI_990 = FlashDesktops ;don't translate
MUI_989 = FDHooks.dll ;if a process' path contains this file than it's killed. ;don't translate
MUI_988 = High detail ;the text contained in a typical 2D TW window. ;don't translate
MUI_987 = This application requires Windows XP or later.
MUI_986 = Virus ;don't translate
;
MUI_001 = Tweak found: GENiEBEN riched20.dll
MUI_002 = Tweak found: Custom riched20.dll
MUI_003 = Cheat found: Custom test.rtf
MUI_004 = Sector size is 512 (OK)
MUI_005 = Sector size is
MUI_006 = Cheat found: Custom audio codec
MUI_007 = Cheat found: Modified libraries
MUI_008 = (BAD)