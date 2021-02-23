_run = true;
task_1_4_skip = false;
publicVariableServer "task_1_4_skip";

task_1_4 = player createSimpleTask ["Pickup Water"];
	task_1_4 setSimpleTaskDescription ["Move to the IDAP base to pickup water trucks.","Pickup Water",""];
	task_1_4 setSimpleTaskDestination (getMarkerPos "IDAP_Base");
	task_1_4 setSimpleTaskType "move";
	task_1_4 setTaskState "Assigned";
	["TaskAssigned",["","Pickup Water"]] call BIS_fnc_showNotification;
	
trg_tsk_1_4 = createTrigger ["EmptyDetector", getMarkerPos "IDAP_Base"];
	trg_tsk_1_4 setTriggerArea [20, 20, 20, false];
	trg_tsk_1_4 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_4 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_1_4) || (task_1_4_skip)) then {
		task_1_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Pickup Water"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_4;
		[]execVM "story_1\water_distribution.sqf";
		_run = false;
	};
};