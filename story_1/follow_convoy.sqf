_run = true;
task_1_2_skip = false;
task_1_2_fail = false;
publicVariableServer "task_1_2_skip";
publicVariableServer "task_1_2_fail";

task_1_2 = player createSimpleTask ["Escort Truck"];
	task_1_2 setSimpleTaskDescription ["Escort the truck to checkpoint Alpha.","Escort Truck",""];
	task_1_2 setSimpleTaskType "move";
	task_1_2 setTaskState "Assigned";
	["TaskAssigned",["","Escort Truck"]] call BIS_fnc_showNotification;

trg_tsk_1_2 = createTrigger ["EmptyDetector", getMarkerPos "Checkpoint_Alpha"];
	trg_tsk_1_2 setTriggerArea [15, 15, 15, false];
	trg_tsk_1_2 setTriggerActivation ["VEHICLE", "PRESENT", false];
	trg_tsk_1_2 setTriggerStatements ["this","",""];
	trg_tsk_1_2 triggerAttachVehicle [convoy_lead];

while {_run} do {
	if ((triggerActivated trg_tsk_1_2) || (task_1_2_skip)) then {
		task_1_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Escort Truck"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_2;
		[]execVM "story_1\return_fob_1.sqf";
		_run = false;
	} else {
		if (!(alive convoy_lead) || (task_1_2_fail)) then {
			task_1_2 setTaskState "Failed";
			["TaskFailed",["","Escort Truck"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_1_2;
			[]execVM "story_1\return_fob_1.sqf";
			_run = false;
		};
	};
	task_1_2 setSimpleTaskDestination (getPos convoy_lead);
};