_run = true;
task_3_3_skip = false;
task_3_3_fail = false;
publicVariableServer "task_3_3_skip";
publicVariableServer "task_3_3_fail";

task_3_3 = player createSimpleTask ["Bring Pilot to FOB Alpha"];
	task_3_3 setSimpleTaskDescription ["Bring the Pilot to the FOB for further medical treatment.","Bring Pilot to FOB Alpha",""];
	task_3_3 setSimpleTaskDestination (getMarkerPos "FOB_Alpha");
	task_3_3 setSimpleTaskType "move";
	task_3_3 setTaskState "Assigned";
	["TaskAssigned",["","Bring Pilot to FOB Alpha"]] call BIS_fnc_showNotification;
	
trg_tsk_3_3 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Alpha"];
	trg_tsk_3_3 setTriggerArea [15, 15, 15, false];
	trg_tsk_3_3 setTriggerActivation ["VEHICLE", "PRESENT", false];
	trg_tsk_3_3 setTriggerStatements ["this","",""];
	trg_tsk_3_3 triggerAttachVehicle [pilot];

while {_run} do {
	if ((triggerActivated trg_tsk_3_3) || (task_3_3_skip)) then {
		task_3_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Bring Pilot to FOB Alpha"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_3;

		[pilot] join (group medic);

		[]execVM "story_3\collect_intel.sqf";
		[]execVM "story_3\kill_sergeant.sqf";
		_run = false;
		hurt_loop = false;
	} else {
		if (!(alive pilot) || (task_3_3_fail)) then {
			task_3_3 setTaskState "Failed";
			["TaskFailed",["","Bring Pilot to FOB Alpha"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_3_3;
			[]execVM "story_3\collect_intel.sqf";
			[]execVM "story_3\kill_sergeant.sqf";
			_run = false;
			hurt_loop = false;
		};
	};
};