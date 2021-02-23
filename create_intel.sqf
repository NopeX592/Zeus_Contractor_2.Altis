_run = true;
[] spawn fnc_createintel;

while {_run} do {
	if (task_0_1_skip) then {
		//Create Intel
		remoteExec ["FS_fnc_createintel"];
		_run = false;
	};
};