**Dead Body and Corpse handling**
	3 min timer check

	if !(_x CBA_fnc_nearplayer) then {_x enablesimulation false};
	forEach (allMissionObjects "land");


	- !([_x, _propdynasimarnge] call CBA_fnc_nearPlayer) then {_x enablesimulationglobal false} foreach allDeadMen;
		Client side check ?

	*hideBody* Command - hides then removed
	*addToRemainsCollector [unit1, unit2, vehicle1];*
	- Add Array of units to remains collector

		AAF Prefix everything

		**INTRO**
		//server only exec version
		//should make it seemless/play at same time
		//remove need for conditional checks for client script
		//[] execVM "intro\intro_s.sqf";
		//[] remoteExec [aaf_fnc_introC, -2, false]; //-2 is all clients but not server
		//params remoteExec [functionName, targets, JIP]

		*server lock*
		//serverCommand "#lock"; //Locks the server, prevents new clients from joining.
		//serverCommand "#unlock"; //Unlocks the server, allows new clients to join.
		//this will need to be a spawned function, or part of intro_s for timing
		//do we really NEED this ?
