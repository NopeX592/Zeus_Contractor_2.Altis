_run = true;
task_2_2_skip = false;
task_2_2_fail = false;
publicVariableServer "task_2_2_skip";
publicVariableServer "task_2_2_fail";

task_2_2 = player createSimpleTask ["Bring Source to FOB"];
	task_2_2 setSimpleTaskDescription ["Bring the source to the FOB.","Bring Source to FOB",""];
	task_2_2 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_2_2 setSimpleTaskType "move";
	task_2_2 setTaskState "Assigned";
	["TaskAssigned",["","Bring Source to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_2_2 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_2_2 setTriggerArea [15, 15, 15, false];
	trg_tsk_2_2 setTriggerActivation ["VEHICLE", "PRESENT", false];
	trg_tsk_2_2 setTriggerStatements ["this","",""];
	trg_tsk_2_2 triggerAttachVehicle [source];

while {_run} do {
	if ((triggerActivated trg_tsk_2_2) || (task_2_2_skip)) then {
		task_2_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Bring Source to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_2;
		[source] join (group fob_major);
		[]execVM "story_2\pickup_poi.sqf";
		_run = false;
	} else {
		if (!(alive source) || (task_2_2_fail)) then {
			task_2_2 setTaskState "Failed";
			["TaskFailed",["","Bring Source to FOB"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_2_2;
			[]execVM "story_2\pickup_poi.sqf";
			_run = false;
		};
	};
};