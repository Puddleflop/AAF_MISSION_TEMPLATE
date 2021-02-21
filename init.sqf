// INIT ///////////////////////////////////////////////////////////////////////////////////////////
/*
	- Executed by everyone when mission is started (before briefing screen).
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
finishMissionInit; // Finish world initialization before mission is launched
// SETUP INTRO/////////////////////////////////////////////////////////////////////////////////////
aaf_fnc_introC = compile preprocessFile "intro\intro_c.sqf"; //client intro Function
aaf_fnc_introS = compile preprocessFile "intro\intro_s.sqf"; //server intro Function
if (isServer) then { //initserver.sqf ?
	[] spawn aaf_fnc_introS;
};
if (hasInterface) then { //initplayerlocal.sqf ? //remoteExec
	[] spawn aaf_fnc_introC;
};
