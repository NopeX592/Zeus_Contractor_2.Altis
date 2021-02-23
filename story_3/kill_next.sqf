_run = true;
task_3_6_skip = false;
publicVariableServer "task_3_6_skip";

task_3_6 = player createSimpleTask ["Kill the next in line"];
	task_3_6 setSimpleTaskDescription ["Kill the next in line you may find him in the estimated area.","Kill the next in line",""];
	task_3_6 setSimpleTaskDestination (getMarkerPos "kill_next");
	task_3_6 setSimpleTaskType "kill";
	task_3_6 setTaskState "Assigned";
	["TaskAssigned",["","Kill the next in line"]] call BIS_fnc_showNotification;

_marker_next = createMarker ["Kill the enemy Sergeant", getMarkerPos "kill_next"];
	_marker_next setMarkerShape "ELLIPSE";
	_marker_next setMarkerSize [100, 100];

while {_run} do {
	if ((!alive next_med) || (task_3_6_skip)) then {
		task_3_6 setTaskState "Succeeded";
		_marker_next setMarkerSize [0, 0];
		["TaskSucceeded",["","Kill the next in line"]] call BIS_fnc_showNotification;
		[]execVM "story_3\return_fob_1.sqf";
		_run = false;
	};
};