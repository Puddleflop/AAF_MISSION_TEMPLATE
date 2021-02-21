///////////////////////////////////////////////////////////////////////////////////////////////////
/*
Author: F3 + AAF
Description: Checks if player is within distance of unit - Based on CBA_fnc_listPlayer
Parameters:
	1. Entitiy to be checked from 										| MANDATORY
	2. Distance to unit to be checked for player			| MANDATORY
Returns:
	true or False
Example:
	[unit,distance] call ws_fnc_nearPlayer
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
params [
	["_ent", objNull, ["", objNull, grpNull, locationNull, []]],
	["_distance", 0, [0]]
];
private ["_pos","_players"];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

_pos = getposATL (leader _ent);//_pos = _ent call ws_fnc_getEPos;
//_players = [] call ws_fnc_listPlayers;
{
	if (_pos distance _x < _distance) exitWith {true};
	false
} forEach _humanplayers;
