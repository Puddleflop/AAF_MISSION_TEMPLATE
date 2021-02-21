// INIT SERVER/////////////////////////////////////////////////////////////////////////////////////
/*
	- Executed only on server when mission is started.
*/
//LRM MISSION NAME ////////////////////////////////////////////////////////////////////////////////
//No LRM Name, No LRM function
lrm_mission_name = "LRMDEFAULT";//unique LRM name HAS TO BE UNIQUE PER CAMPAIGN. Can be anything in quotes without spaces i.e. "LRMTom1", "dingdong", "spam"
publicVariable "lrm_mission_name";
//DYNAMIC GROUPS///////////////////////////////////////////////////////////////////////////////////
["Initialize", [true]] call BIS_fnc_dynamicGroups;// Initializes the Dynamic Groups framework and groups led by a player at mission start will be registered
//["Initialize"] call BIS_fnc_dynamicGroups;// Initializes the Dynamic Groups framework
//SIMULATION HIT EVENTHANDLER//////////////////////////////////////////////////////////////////////
/*
{
	if (_x isKindOf "Man") then { //only affects units, not vehicles or objects
		_x addEventHandler ["Hit", { //on hit Removed from Dynamic Sim
			params["_unit"];
			_untGrp = group _unit;
			if !(dynamicSimulationEnabled _untGrp) exitwith {};
				_untGrp enableDynamicSimulation false;
			};

		}];
		_x addEventHandler ["Killed",{//on killed Disables Simulation for unit
			_this spawn {
				sleep 3;
				params["_unit"];
				_unit enableSimulationGlobal false;
				_unit removeAllEventHandlers "Hit";
				_unit removeAllEventHandlers "Killed";
			};
		}];
	};
} forEach allUnits; // All preplaced Editor units
*/
