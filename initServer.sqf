if (isServer) then
{
	execVM "post_briefing_init.sqf";
}
else 
{
	hint "No Server Detected";
};