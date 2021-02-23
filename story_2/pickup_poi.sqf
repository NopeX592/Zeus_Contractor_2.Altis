_run = true;
task_2_3_skip = false;
task_2_3_fail = false;
publicVariableServer "task_2_3_skip";
publicVariableServer "task_2_3_fail";

task_2_3 = player createSimpleTask ["Pickup POI"];
	task_2_3 setSimpleTaskDescription ["Pickup the POI.","Pickup POI",""];
	task_2_3 setSimpleTaskDestination (getMarkerPos "POI_Location");
	task_2_3 setSimpleTaskType "move";
	task_2_3 setTaskState "Assigned";
	["TaskAssigned",["","Pickup POI"]] call BIS_fnc_showNotification;
	
trg_tsk_2_3 = createTrigger ["EmptyDetector", getMarkerPos "POI_Location"];
	trg_tsk_2_3 setTriggerArea [15, 15, 15, false];
	trg_tsk_2_3 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_2_3 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_2_3) || (task_2_3_skip)) then {
		task_2_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Pickup POI"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_3;
		[POI] join (group player);
		[]execVM "story_2\poi_fob.sqf";
		_run = false;
	} else {
		if (!(alive POI) || (task_2_3_fail)) then {
			task_2_3 setTaskState "Failed";
			["TaskFailed",["","Pickup POI"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_2_3;
			[]execVM "story_2\return_fob_1.sqf";
			_run = false;
		};
	};
};