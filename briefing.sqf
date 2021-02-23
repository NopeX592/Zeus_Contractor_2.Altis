_run_1 = true;
_run_2 = false;
_run_3 = false;

briefing_0_1_done = false;
briefing_0_2_done = false;
briefing_0_3_done = false;
publicVariableServer "briefing_0_1_done";
publicVariableServer "briefing_0_2_done";
publicVariableServer "briefing_0_3_done";


while {_run_1} do {
	if (briefing_0_1_done) then {
	screen_lrg_1 setObjectTextureGlobal [0,"media\truck.paa"];
	screen_lrg_2 setObjectTextureGlobal [0,"media\miller.paa"];
	_run_1 = false;
	_run_2 = true;
	};
};

while {_run_2} do {
	if (briefing_0_2_done) then {
	screen_lrg_1 setObjectTextureGlobal [0,"media\source.paa"];
	screen_lrg_2 setObjectTextureGlobal [0,""];
	_run_2 = false;
	_run_3 = true;
	};
};

while {_run_3} do {
	if (briefing_0_3_done) then {
	screen_lrg_1 setObjectTextureGlobal [0,"media\pilots.paa"];
	screen_lrg_2 setObjectTextureGlobal [0,"media\helicopter.paa"];
	_run_3 = false;
	};
};