_run = true;
task_3_5_skip = false;
publicVariableServer "task_3_5_skip";

task_3_5 = player createSimpleTask ["Kill the enemy Sergeant"];
	task_3_5 setSimpleTaskDescription ["Kill the enemy Sergeant you may find him in the estimated area.","Kill the enemy Sergeant",""];
	task_3_5 setSimpleTaskDestination (getMarkerPos "kill_commander");
	task_3_5 setSimpleTaskType "kill";
	task_3_5 setTaskState "Assigned";
	["TaskAssigned",["","Kill the enemy Sergeant"]] call BIS_fnc_showNotification;

_marker_commander = createMarker ["Kill the enemy Sergeant", getMarkerPos "kill_commander"];
	_marker_commander setMarkerShape "ELLIPSE";
	_marker_commander setMarkerSize [100, 100];

while {_run} do {
	if ((!alive commander_med) || (task_3_5_skip)) then {
		task_3_5 setTaskState "Succeeded";
		_marker_commander setMarkerSize [0, 0];
		["TaskSucceeded",["","Kill the enemy Sergeant"]] call BIS_fnc_showNotification;
		//[]execVM "story_3\kill_next.sqf";
		_run = false;
	};
};