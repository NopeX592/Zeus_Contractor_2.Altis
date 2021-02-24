_run_1 = true;
_run_2 = false;
_run_3 = false;

//Diary  by DaVidoSS
private ["_mission", "_diary_text", "_roles"];
_mission = toUpper (format ["%1",getText (missionconfigfile >> "onLoadName")]);

_diary_text = _mission + "<br/>" + 
format [" Date: %3.%2.%1<br/>",date select 0,date select 1,date select 2]+
format [" Location: %1<br/>",worldName]+
format [" Type: %1<br/>",getText (missionconfigfile >> "Header" >> "gameType")]+
format [" Players: %1-%2<br/>",getNumber (missionconfigfile >> "Header" >> "minPlayers"),getNumber (missionconfigfile >> "Header" >> "maxPlayers")]+
format [" Authors: %1<br/><br/>",getText (missionconfigfile >> "author")]+
"<br/>"+
"FEATURES:<br/>"+
"• Virtual Arsenal<br/>"+
"• Artillery Support<br/>"+
"<br/>"+
"THANKS:<br/>"+
"• Oskar for playtesting<br/>"+
"• Oskar for bearing with my expressions of frustration<br/>"+
"• Alex for helping me with programming<br/>"+
"";

_roles = "<br/>"+
"Source or Convoy any order<br/>
	Convoy:<br/>
	• Head to FOB Gamma<br/>
	• Contact will be waiting<br/>
	• Follow to Checkpoint Alpha<br/>
	• Weapons and Tools in truck along with confidential information<br/>
	• Keep on high alert<br/>
	• Upon arrival return to FOB<br/>
<br/>
	Source:<br/>
	• Dead or Alive<br/>
	• Preferred Alive<br/>
	• After capture bring to FOB<br/>
	• If dead further information at the time<br/>
<br/>
CasEvac and Helicopter High priority<br/>
	CasEvac and Helicopter:<br/>
	• Pilot has information<br/>
	• Destroy Helicopter<br/>
	• First Aid on site<br/>
	• Bring him to main airfield<br/>
<br/>
Optional Tasks:<br/>
• Destroy enemy fuel depot<br/>
• Takeout enemy artillery<br/>
<br/>
Support:<br/>
• Artillery Strikes possible<br/>
• Use only if no other way<br/>
<br/>"+
"";

waitUntil {!isNull player};
player createDiaryRecord ["Diary", ["Notes",_roles]];
player createDiaryRecord ["Diary", ["Mission brief",
format ["
%1<br/>
Hello Gentleman's!<br/>
<br/>
As you know, we conduct a operations against hostile UAFoN.<br/>
<br/>
Today's task is, to sneak up behind enemy lines.<br/>
After successful infiltration we're on 'stand by' being at HQ disposal.<br/>
Orders form HQ are expected form this stage of mission.<br/>
Our progress, as well as current situation is being constantly monitored by drone..<br/>",worldName]+
"<br/>***********************************************************************************<br/>
<br/>"
]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];

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