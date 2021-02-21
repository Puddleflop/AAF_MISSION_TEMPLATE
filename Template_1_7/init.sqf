// INIT ///////////////////////////////////////////////////////////////////////////////////////////
/*
	- Executed by everyone when mission is started (before briefing screen).
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
// Finish world initialization before mission is launched
//finishMissionInit; //Stated to cause CUP searchlight issues ??
// ZBE CACHE //////////////////////////////////////////////////////////////////////////////////////
//This is what you change for the Reducer range
if (isServer) then {
	[800,	//[AiCacheDistance(players) //dynasim range ?
	-1, 		//TargetFPS(-1 for Auto)
	false, 	//Debug
	800, 		//CarCacheDistance
	1000, 	//AirCacheDistance
	1000 		//BoatCacheDistance
	]execvm "zbe_cache\main.sqf"
};
// INTRO///////////////////////////////////////////////////////////////////////////////////////////
aaf_fnc_introC = compile preprocessFile "intro\intro_c.sqf"; //client intro Function
aaf_fnc_introS = compile preprocessFile "intro\intro_s.sqf"; //server intro Function

if (isServer) then { //initserver.sqf ?
	[] spawn aaf_fnc_introS;
};

if (hasInterface) then { //initplayerlocal.sqf ? //remoteExec
	[] spawn aaf_fnc_introC;
};

//server only exec version
//should make it seemless/play at same time
//remove need for conditional checks for client script
//[] execVM "intro\intro_s.sqf";
//[] remoteExec [aaf_fnc_introC, -2, false]; //-2 is all clients but not server
//params remoteExec [functionName, targets, JIP]


//do we really NEED this ?
//this will need to be a spawned function, or part of intro_s for timing
//serverCommand "#lock"; //Locks the server, prevents new clients from joining.
//serverCommand "#unlock"; //Unlocks the server, allows new clients to join.
