_run = true;
task_1_1_skip = false;
publicVariableServer "task_1_1_skip";

task_1_1 = player createSimpleTask ["Move to FOB Gamma"];
	task_1_1 setSimpleTaskDescription ["Move to the FOB to escort the convoy.","Move to FOB Gamma",""];
	task_1_1 setSimpleTaskDestination (getMarkerPos "FOB_Gamma");
	task_1_1 setSimpleTaskType "meet";
	task_1_1 setTaskState "Created";
	
trg_tsk_1_1 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Gamma"];
	trg_tsk_1_1 setTriggerArea [10, 10, 10, false];
	trg_tsk_1_1 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_1 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_1_1) || (task_1_1_skip)) then {
		task_1_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB Gamma"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_1;
		[]execVM "story_1\follow_convoy.sqf";
		_run = false;
	};
};