_run = true;
task_O_2_skip = false;
publicVariableServer "task_O_2_skip";

task_O_2 = player createSimpleTask ["Destroy Fuel Depot (Optional)"];
	task_O_2 setSimpleTaskDescription ["Destroy the enemy Fuel Depot.","Destroy Fuel Depot (Optional)",""];
	task_O_2 setSimpleTaskDestination (getPos tank_1);
	task_O_2 setSimpleTaskType "destroy";
	task_O_2 setTaskState "Created";

while {_run} do {
	if (!(alive tank_1) && !(alive tank_2) && !(alive tank_3)) then {
		task_O_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Fuel Depot (Optional)"]] call BIS_fnc_showNotification;
		_run = false;
	};
};