task_3_1_skip = false;
hurt_loop = false;
publicVariableServer "task_3_1_skip";
publicVariableServer "hurt_loop";

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
	marker_pilots setMarkerSize [0, 0];
	[]execVM "story_3\casevac_dropoff.sqf";
	[pilot] join (group player);
	pilot call BIS_fnc_ambientAnim__terminate;
	hurt_loop = true;
	pilot removeAllEventHandlers "HandleHeal";
}];