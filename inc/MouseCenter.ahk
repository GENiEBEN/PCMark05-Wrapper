;Move mouse in the middle of the screen once a second.
	xo=%k_WindowX%
	yo=%k_WindowY%
	Loop
	{
	DllCall( "SetCursorPos", int, xo, int, yo )
	Sleep, 10000
	}
