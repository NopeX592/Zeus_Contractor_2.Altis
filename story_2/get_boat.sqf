_run = true;
task_2_6_skip = false;
task_2_6_fail = false;
publicVariableServer "task_2_6_skip";

task_2_6 = player createSimpleTask ["Get Boat (Optional)"];
	task_2_6 setSimpleTaskDescription ["Get the Boat from FOB Charlie.","Get Boat (Optional)",""];
	task_2_6 setSimpleTaskDestination (getPos boat);
	task_2_6 setSimpleTaskType "interact";
	task_2_6 setTaskState "Assigned";
	["TaskAssigned",["","Get Boat (Optional)"]] call BIS_fnc_showNotification;

while {_run} do {
	if ((player in boat) || (task_2_6_skip)) then {
		task_2_6 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Boat (Optional)"]] call BIS_fnc_showNotification;
		_run = false;
	} else {
		if (!(alive boat) || (task_2_6_fail)) then {
			task_2_6 setTaskState "Failed";
			["TaskFailed",["","Get Boat (Optional)"]] call BIS_fnc_showNotification;
			_run = false;
		};
	};
};