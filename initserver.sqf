// INIT SERVER/////////////////////////////////////////////////////////////////////////////////////
/*
	- Executed only on server when mission is started.
*/
// DEBUG MODE /////////////////////////////////////////////////////////////////////////////////////
//Global debug setting, true = debug messages on  false = no debug messages
aaf_debugmode = false;
publicVariable "aaf_debugmode";
//DYNAMIC GROUPS///////////////////////////////////////////////////////////////////////////////////
["Initialize", [true]] call BIS_fnc_dynamicGroups;// Initializes the Dynamic Groups framework and groups led by a player at mission start will be registered
//INTRO VARIABLE //////////////////////////////////////////////////////////////////////////////////
AAF_Intro = false; //predefine for clarity
publicVariable "AAF_Intro"; //broadcast
// AAF REDUCER ////////////////////////////////////////////////////////////////////////////////////
//Move to initserver.sqf to ensure it only fires on the server.
//Verify HC compatability  for above as well
aaf_fnc_rInit = compile preprocessFile "scripts\fn_rInit.sqf";
aaf_fnc_rTracker = compile preprocessFile "scripts\fn_rTracker.sqf";
aaf_fnc_rCache = compile preprocessFile "scripts\fn_rCache.sqf";
aaf_fnc_rUncache = compile preprocessFile "scripts\fn_rUncache.sqf";
f_var_reducerAggressiveness = 1;
[120] spawn aaf_fnc_rInit;
//SIMULATION HIT EVENTHANDLER//////////////////////////////////////////////////////////////////////
/* Needed ?
{
	if (_x isKindOf "Man") then { //only affects units, not vehicles or objects
		_x addEventHandler ["Hit", { //on hit Removed from Dynamic Sim
			params["_unit"];
			_untGrp = group _unit;
			_untGrp enableDynamicSimulation false;
			//objectName removeEventHandler [type, index] //_x ?
			//[type, index]
			//index: Number - value returned by addEventHandler
		}];
		_x addEventHandler ["Killed",{//on killed Disables Simulation for unit
			_this spawn {
				sleep 3;
				params["_unit"];
				_unit enableSimulationGlobal false;
			};
		}];
	};
} forEach allUnits; // All preplaced Editor units
//same effect with vehicle detection ?
//or same EVERYTHING detection
*/
