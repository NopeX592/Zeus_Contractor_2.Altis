_run = true;
task_1_6_skip = false;
publicVariableServer "task_1_6_skip";

task_1_6 = player createSimpleTask ["Move to FOB"];
	task_1_6 setSimpleTaskDescription ["Move to the FOB to receive debrief.","Move to FOB",""];
	task_1_6 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_1_6 setSimpleTaskType "move";
	task_1_6 setTaskState "Assigned";
	["TaskAssigned",["","Move to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_1_6 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_1_6 setTriggerArea [15, 15, 15, false];
	trg_tsk_1_6 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_6 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_1_6) || (task_1_6_skip)) then {
		task_1_6 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_6;
		_run = false;
	};
};