waituntil {time > 5};
waitUntil {!isNull (findDisplay 46)};
sleep 5;
//DYNAMIC SIMULATION GROUP EVENTHANDLER/ //////////////////////////////////////////////////////////
//Will this work ?
// Dynaor reducer ?
player/*this*/ addEventHandler ["CuratorGroupPlaced", {
	params ["_curator", "_group"];
	_group enableDynamicSimulation true; //add dynasim to Zues spawned groups
	// OR
	[RMM_Reducer_Groups, _group] call BIS_fnc_arrayPush; // and group to Reducer
}];
///////////////////////////////////////////////////////////////////////////////////////////////////
