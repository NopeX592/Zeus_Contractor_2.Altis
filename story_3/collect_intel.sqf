_run = true;
task_3_4_skip = false;
task_3_4_fail = false;
publicVariableServer "task_3_4_skip";
publicVariableServer "task_3_4_fail";

task_3_4 = player createSimpleTask ["Gather Intel"];
	task_3_4 setSimpleTaskDescription ["Gather Intel you may find it in the estimated area.","Gather Intel",""];
	task_3_4 setSimpleTaskDestination (getMarkerPos "gather_intel");
	task_3_4 setSimpleTaskType "documents";
	task_3_4 setTaskState "Assigned";
	["TaskAssigned",["","Gather Intel"]] call BIS_fnc_showNotification;

_marker_intel = createMarker ["Gather Intel", getMarkerPos "gather_intel"];
	_marker_intel setMarkerShape "ELLIPSE";
	_marker_intel setMarkerSize [25, 25];

while {_run} do {
	if (((isNull intel_1) && (isNull intel_2)) || (task_3_4_skip)) then {
		task_3_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Gather Intel"]] call BIS_fnc_showNotification;
		_marker_intel setMarkerSize [0, 0];
		[]execVM "story_3\kill_next.sqf";
		_run = false;
	};
};






