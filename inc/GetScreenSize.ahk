	Clipboard = 									; Empty the clipboard
	SysGet, k_WorkArea, MonitorWorkArea, %Monitor% 	;Get size of WorkArea on the chosen monitor
	k_WindowX = %k_WorkAreaRight%
	k_WindowX -= %k_WorkAreaLeft%  					; ow k_WindowX contains the width of this monitor
	k_WindowX -= %k_WindowWidth%
	k_WindowX /= 2  								;Calculate position to center something horizontally
	k_WindowX += %k_WorkAreaLeft%
	k_WindowY = %k_WorkAreaBottom%
	k_WindowY -= %k_WindowHeight%
	k_WindowY /= 2