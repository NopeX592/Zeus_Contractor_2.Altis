_run = true;
task_3_7_skip = false;
publicVariableServer "task_3_7_skip";

task_3_7 = player createSimpleTask ["Move to FOB"];
	task_3_7 setSimpleTaskDescription ["Move to the FOB.","Move to FOB",""];
	task_3_7 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_3_7 setSimpleTaskType "move";
	task_3_7 setTaskState "Assigned";
	["TaskAssigned",["","Move to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_3_7 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_3_7 setTriggerArea [15, 15, 15, false];
	trg_tsk_3_7 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_3_7 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_3_7) || (task_3_7_skip)) then {
		task_3_7 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_7;
		_run = false;
	};
};