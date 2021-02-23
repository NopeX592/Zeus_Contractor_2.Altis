_run = true;
task_2_4_skip = false;
task_2_4_fail = false;
publicVariableServer "task_2_4_skip";
publicVariableServer "task_2_4_fail";

task_2_4 = player createSimpleTask ["Bring POI to FOB"];
	task_2_4 setSimpleTaskDescription ["Bring the POI to the FOB.","Bring POI to FOB",""];
	task_2_4 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_2_4 setSimpleTaskType "move";
	task_2_4 setTaskState "Assigned";
	["TaskAssigned",["","Bring POI to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_2_4 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_2_4 setTriggerArea [15, 15, 15, false];
	trg_tsk_2_4 setTriggerActivation ["VEHICLE", "PRESENT", false];
	trg_tsk_2_4 setTriggerStatements ["this","",""];
	trg_tsk_2_4 triggerAttachVehicle [POI];

while {_run} do {
	if ((triggerActivated trg_tsk_2_4) || (task_2_4_skip)) then {
		task_2_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Bring POI to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_4;
		[POI] join (group fob_major);
		[]execVM "story_2\get_boat.sqf";
		[]execVM "story_2\raid_stronghold.sqf";
		_run = false;
	} else {
		if (!(alive POI) || (task_2_4_fail)) then {
			task_2_4 setTaskState "Failed";
			["TaskFailed",["","Bring POI to FOB"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_2_4;
			[]execVM "story_2\return_fob_1.sqf";
			_run = false;
		};
	};
};