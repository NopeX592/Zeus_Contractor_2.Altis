_run = true;
PB_fnc_postbriefing =
{
	radio say3D "Fortunateson";
	intel_1 addAction ["Pickup Intel","deleteVehicle intel_1;",nil,1.5,true,false,"","true",2,false,"",""];
	intel_2 addAction ["Pickup Intel","deleteVehicle intel_2;",nil,1.5,true,false,"","true",2,false,"",""];
};

while {_run} do {
	if (task_0_1_skip) then {
		//Play Fortunate Son and Create Intel
		remoteExec ["PB_fnc_postbriefing", 0, true];
		_run = false;
	};
};