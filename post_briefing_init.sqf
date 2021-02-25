_run = true;
water_handed = 0;
publicVariable "water_handed";

sleep 1;

PB_fnc_rickroll = {
	radio say3D "Giveup";
};

//Remove Action
PB_fnc_action_1 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	["hi"] remoteExec ["hint", 0, true];
	water_handed = water_handed + 1;
	[civilian_1, handwater_1] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_2 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	["hi"] remoteExec ["hint", 0, true];
	water_handed = water_handed + 1;
	[civilian_2, handwater_2] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_3 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	["hi"] remoteExec ["hint", 0, true];
	water_handed = water_handed + 1;
	[civilian_3, handwater_3] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_4 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	["hi"] remoteExec ["hint", 0, true];
	water_handed = water_handed + 1;
	[civilian_4, handwater_4] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_5 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	["hi"] remoteExec ["hint", 0, true];
	water_handed = water_handed + 1;
	[civilian_5, handwater_5] remoteExec ["removeAction", 0, true];
};

//Create post briefing function
PB_fnc_postbriefing = {
	radio say3D "Fortunateson";

	//Add Action to Intel Objects
	intel_1 addAction ["Pickup Intel","deleteVehicle intel_1;",nil,1.5,true,false,"","true",2,false,"",""];
	intel_2 addAction ["Pickup Intel","deleteVehicle intel_2;",nil,1.5,true,false,"","true",2,false,"",""];
	
	//Add Action to civilians
	handwater_1 = civilian_1 addAction ["Give Water","[] call PB_fnc_action_1;",nil,2.5,true,false,"","true",3,false,"",""];
	handwater_2 = civilian_2 addAction ["Give Water","[] call PB_fnc_action_2;",nil,2.5,true,false,"","true",3,false,"",""];
	handwater_3 = civilian_3 addAction ["Give Water","[] call PB_fnc_action_3;",nil,2.5,true,false,"","true",3,false,"",""];
	handwater_4 = civilian_4 addAction ["Give Water","[] call PB_fnc_action_4;",nil,2.5,true,false,"","true",3,false,"",""];
	handwater_5 = civilian_5 addAction ["Give Water","[] call PB_fnc_action_5;",nil,2.5,true,false,"","true",3,false,"",""];
};

sleep 1;

while {_run} do {
	if (task_0_1_skip) then {
		if (isServer) then {
			//Play Fortunate Son, Create Intel, Create Give Water
			[PB_fnc_postbriefing] remoteExec ["call", 0, true];
			_run = false;

			sleep 141;

			while {true} do {
				if (isServer) then {
					//Play Never Gonna Give You Up
					sleep 215;
					[PB_fnc_rickroll] remoteExec ["call", 0, true];
				};
			};
		};
	};
};