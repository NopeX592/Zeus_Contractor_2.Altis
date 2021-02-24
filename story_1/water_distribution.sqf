_run = true;
task_1_5_skip = false;
task_1_5_cancelled = false;
publicVariableServer "task_1_5_skip";
publicVariableServer "task_1_5_cancelled";

task_1_5 = player createSimpleTask ["Distribute Water"];
	task_1_5 setSimpleTaskDescription ["Distribute water amongst those in need, be careful as insurgents might attack.","Distribute Water",""];
	task_1_5 setSimpleTaskDestination (getMarkerPos "IDAP_Distribute");
	task_1_5 setSimpleTaskType "interact";
	task_1_5 setTaskState "Assigned";
	["TaskAssigned",["","Distribute Water"]] call BIS_fnc_showNotification;
	
trg_tsk_1_5 = createTrigger ["EmptyDetector", getMarkerPos "IDAP_Distribute"];
	trg_tsk_1_5 setTriggerArea [20, 20, 20, false];
	trg_tsk_1_5 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_5 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_1_5) || (task_1_5_skip)) then {
		task_1_5 setTaskState "Succeeded";
		["TaskSucceeded",["","Distribute Water"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_1_5;
		[]execVM "story_1\return_fob_2.sqf";
		_run = false;
	} else {
		if (task_1_5_cancelled) then {
			task_1_5 setTaskState "Canceled";
			["TaskCanceled",["","Distribute Water"]] call BIS_fnc_showNotification;
			deletevehicle trg_tsk_1_5;
			[]execVM "story_1\return_fob_2.sqf";
			_run = false;
		};
	};
};