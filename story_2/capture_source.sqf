_run = true;
task_2_1_capt = false;
task_2_1_kill = false;
publicVariableServer "task_2_1_capt";
publicVariableServer "task_2_1_kill";

task_2_1 = player createSimpleTask ["Takeout or Capture Source"];
	task_2_1 setSimpleTaskDescription ["Takeout or capture my source so that he can't hand over information to the insurgents.","Takeout or Capture Source",""];
	task_2_1 setSimpleTaskDestination (getMarkerPos "Source_Estimate");
	task_2_1 setSimpleTaskType "kill";
	task_2_1 setTaskState "Created";
	
_marker_source = createMarker ["Takeout or Capture Source", getMarkerPos "Source_Estimate"];
	_marker_source setMarkerShape "ELLIPSE";
	_marker_source setMarkerSize [100, 100];

while {_run} do {
	if (!(alive source) || (task_2_1_kill)) then {
		task_2_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Takeout Source"]] call BIS_fnc_showNotification;
		deleteMarker _marker_source;
		[]execVM "story_2\pickup_poi.sqf";
		_run = false;
	} else {
		if (!(source getVariable "ENH_isHostage") || (task_2_1_capt)) then {
			task_2_1 setTaskState "Succeeded";
			["TaskSucceeded",["","Capture Source"]] call BIS_fnc_showNotification;
			deleteMarker _marker_source;
			[source] join (group player);
			[]execVM "story_2\source_fob.sqf";
			_run = false;
		};
	};
};