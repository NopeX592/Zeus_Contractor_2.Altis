_run = true;
task_3_1_skip = false;
publicVariableServer "task_3_1_skip";

task_3_1 = player createSimpleTask ["Find and Heal Pilots"];
	task_3_1 setSimpleTaskDescription ["Find and heal the pilots who were shot down.","Find and Heal Pilots",""];
	task_3_1 setSimpleTaskDestination (getMarkerPos "Pilots_Estimate");
	task_3_1 setSimpleTaskType "heal";
	task_3_1 setTaskState "Created";
	
marker_pilots = createMarker ["Find and Heal Pilots", getMarkerPos "Pilots_Estimate"];
	marker_pilots setMarkerShape "ELLIPSE";
	marker_pilots setMarkerSize [100, 100];

_handler_pilots = pilot addEventHandler ["HandleHeal", {
	task_3_1 setTaskState "Succeeded";
	["TaskSucceeded",["","Find and Heal Pilots"]] call BIS_fnc_showNotification;
	marker_pilots setMarkerSize [0, 0];;
	sleep 4;
	[]execVM "story_3\casevac_dropoff.sqf";
	pilot removeAllEventHandlers "HandleHeal";
	pilot_2 = group player createUnit ["B_Helipilot_F", position pilot, [], 0, "FORM"];
	deleteVehicle pilot;
	_run = false;
}];