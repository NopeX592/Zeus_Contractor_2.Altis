_run = true;
PB_fnc_postbriefing = {
	radio say3D "Fortunateson";
	intel_1 addAction ["Pickup Intel","deleteVehicle intel_1;",nil,1.5,true,false,"","true",2,false,"",""];
	intel_2 addAction ["Pickup Intel","deleteVehicle intel_2;",nil,1.5,true,false,"","true",2,false,"",""];
};

while {_run} do {
	if (task_0_1_skip) then {
		if (isServer) then {
			//Play Fortunate Son and Create Intel
			[PB_fnc_postbriefing] remoteExec ["call", 0, true];
			_run = false;
		};
	};
};

sleep 141;

PB_fnc_rickroll = {
	radio say3D "Giveup";
};

if (isServer) then {
	//Play Never Gonna Give You Up
	[PB_fnc_rickroll] remoteExec ["call", 0, true];
};