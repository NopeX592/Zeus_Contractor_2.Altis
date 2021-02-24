PB_fnc_giveradio = {
	player addItem "ACRE_PRC152";
};

if (isServer) then {
	[PB_fnc_giveradio] remoteExec ["call", 0, true];
};