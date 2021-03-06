_run = true;
task_0_1_skip = false;
publicVariableServer "task_0_1_skip";

task_0_1 = player createSimpleTask ["Get Briefing"];
	task_0_1 setSimpleTaskDescription ["Get your Briefing.","Get Briefing",""];
	task_0_1 setSimpleTaskDestination (getMarkerPos "first_brief");
	task_0_1 setSimpleTaskType "whiteboard";
	task_0_1 setTaskState "Assigned";
	["TaskAssigned",["","Get Briefing"]] call BIS_fnc_showNotification;

while {_run} do {
	if (task_0_1_skip) then {
		task_0_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Briefing"]] call BIS_fnc_showNotification;
		
		//Execute Missions
		[]execVM "story_1\convoy_start.sqf";
		[]execVM "story_2\capture_source.sqf";
		[]execVM "story_3\destroy_helicopter.sqf";
		[]execVM "story_3\find_pilots.sqf";
		[]execVM "optional\destroy_artillery.sqf";
		[]execVM "optional\fuel_depot.sqf";
		[]execVM "post_briefing_init.sqf";
		
		_run = false;
	};
};