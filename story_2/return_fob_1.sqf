_run = true;
task_2_5_skip = false;
publicVariableServer "task_2_5_skip";

task_2_5 = player createSimpleTask ["Move to FOB"];
	task_2_5 setSimpleTaskDescription ["Move to the FOB to to talk to IDAP personnel.","Move to FOB",""];
	task_2_5 setSimpleTaskDestination (getMarkerPos "FOB_Contractor");
	task_2_5 setSimpleTaskType "meet";
	task_2_5 setTaskState "Assigned";
	["TaskAssigned",["","Move to FOB"]] call BIS_fnc_showNotification;
	
trg_tsk_2_5 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor"];
	trg_tsk_2_5 setTriggerArea [15, 15, 15, false];
	trg_tsk_2_5 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_2_5 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_2_5) || (task_2_5_skip)) then {
		task_2_5 setTaskState "Succeeded";
		["TaskSucceeded",["","Move to FOB"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_5;
		[]execVM "story_2\get_boat.sqf";
		[]execVM "story_2\raid_stronghold.sqf";
		_run = false;
	};
};