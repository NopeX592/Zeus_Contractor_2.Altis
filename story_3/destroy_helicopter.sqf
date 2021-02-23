_run = true;
task_3_2_skip = false;
publicVariableServer "task_3_2_skip";

task_3_2 = player createSimpleTask ["Destroy the Helicopter"];
	task_3_2 setSimpleTaskDescription ["Takeout or capture my source so that he can't hand over information to the insurgents.","Destroy the Helicopter",""];
	task_3_2 setSimpleTaskDestination (getMarkerPos "Helicopter_Estimate");
	task_3_2 setSimpleTaskType "destroy";
	task_3_2 setTaskState "Created";
	
marker_helicopter = createMarker ["Destroy the Helicopter", getMarkerPos "Helicopter_Estimate"];
	marker_helicopter setMarkerShape "ELLIPSE";
	marker_helicopter setMarkerSize [100, 100];

_handler_helicopter = helicopter addEventHandler ["Explosion", {
	task_3_2 setTaskState "Succeeded";
	["TaskSucceeded",["","Destroy the Helicopter"]] call BIS_fnc_showNotification;
	marker_helicopter setMarkerSize [0, 0];
	helicopter removeAllEventHandlers "Explosion";
	_run = false;
}];