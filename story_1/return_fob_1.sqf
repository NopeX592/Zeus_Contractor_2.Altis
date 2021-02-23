_run = true;
task_1_3_skip = false;
publicVariableServer "task_1_3_skip";

task_1_3 = player createSimpleTask ["Move to FOB"];
	task_1_3 setSimpleTaskDescription ["Move to the FOB to to talk to IDAP personnel.","Move to FOB",""];
	task_1_3 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_1_3 setSimpleTaskType "talk";
	task_1_3 setTaskState "Assigned";
	["TaskAssigned",["","Move to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_1_3 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_1_3 setTriggerArea [15, 15, 15, false];
	trg_tsk_1_3 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_3 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_1_3) || (task_1_3_skip)) then {
		task_1_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_3;
		[]execVM "story_1\water_pickup.sqf";
		_run = false;
	};
};