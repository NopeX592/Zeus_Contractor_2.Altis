_run = true;
task_2_7_skip = false;
publicVariableServer "task_2_7_skip";

task_2_7 = player createSimpleTask ["Raid Enemy Stronghold"];
	task_2_7 setSimpleTaskDescription ["Raid the enemy Stronghold.","Raid Enemy Stronghold",""];
	task_2_7 setSimpleTaskDestination (getMarkerPos "stronghold");
	task_2_7 setSimpleTaskType "attack";
	task_2_7 setTaskState "Assigned";
	["TaskAssigned",["","Raid Enemy Stronghold"]] call BIS_fnc_showNotification;
	
trg_tsk_2_7 = createTrigger ["EmptyDetector", getMarkerPos "stronghold"];
	trg_tsk_2_7 setTriggerArea [250, 250, 250, false];
	trg_tsk_2_7 setTriggerActivation ["GUER", "NOT PRESENT", false];
	trg_tsk_2_7 setTriggerStatements ["this","",""];
	
_marker_stronghold = createMarker ["Takeout or Capture Source", getMarkerPos "stronghold"];
	_marker_stronghold setMarkerShape "ELLIPSE";
	_marker_stronghold setMarkerSize [250, 250];

while {_run} do {
	if ((triggerActivated trg_tsk_2_7) || (task_2_7_skip)) then {
		task_2_7 setTaskState "Succeeded";
		["TaskSucceeded",["","Raid Enemy Stronghold"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_2_7;
		[]execVM "story_2\return_fob_2.sqf";
		deleteMarker _marker_stronghold;
		_run = false;
		task_2_6 setTaskState "Canceled";
		["TaskCanceled",["","Get Boat (Optional)"]] call BIS_fnc_showNotification;
	};
};