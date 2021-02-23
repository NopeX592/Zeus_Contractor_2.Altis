_run = true;
task_O_1_skip = false;
publicVariableServer "task_O_1_skip";

task_O_1 = player createSimpleTask ["Destroy Artillery (Optional)"];
	task_O_1 setSimpleTaskDescription ["Destroy the enemy Artillery.","Destroy Artillery (Optional)",""];
	task_O_1 setSimpleTaskDestination (getPos mortar_1);
	task_O_1 setSimpleTaskType "destroy";
	task_O_1 setTaskState "Created";

while {_run} do {
	if (!(alive mortar_1) && !(alive mortar_2) && !(alive mortar_3)) then {
		task_O_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Artillery (Optional)"]] call BIS_fnc_showNotification;
		_run = false;
	};
};