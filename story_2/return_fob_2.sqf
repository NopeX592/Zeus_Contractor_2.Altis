_run = true;
task_2_8_skip = false;
publicVariableServer "task_2_8_skip";

task_2_8 = player createSimpleTask ["Move to FOB"];
	task_2_8 setSimpleTaskDescription ["Move to the FOB.","Move to FOB",""];
	task_2_8 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_2_8 setSimpleTaskType "meet";
	task_2_8 setTaskState "Assigned";
	["TaskAssigned",["","Move to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_2_8 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_2_8 setTriggerArea [15, 15, 15, false];
	trg_tsk_2_8 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_2_8 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_2_8) || (task_2_8_skip)) then {
		task_2_8 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_8;
		_run = false;
	};
};