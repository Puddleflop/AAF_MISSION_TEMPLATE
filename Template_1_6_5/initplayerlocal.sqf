// INIT PLAYER LOCAL //////////////////////////////////////////////////////////////////////////////
/*
	- Executed locally when player joins mission (includes both mission start and JIP).
*/
///////////////////////////////////////////////////////////////////////////////////////////////////

//HEADLESS CHECK///////////////////////////////////////////////////////////////////////////////////
if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.

waituntil {getplayeruid player != ""};//For uid locked scripts / abilities
// LRM THINGS /////////////////////////////////////////////////////////////////////////////////////
//[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory; //Save player loadout for respawn
//_LRMname="xxxx";
_LRMname= missionName;
_savedLRMname = profilenamespace getvariable ["LRMname","nothing"];
if ((str _savedLRMname) == (str _LRMname))
	then { systemchat "you have been here before";}
	else {
		systemchat "you are not from around here";
		profileNamespace setVariable ["LRMname",_LRMname];
		["LRM_Initial_Loadout","save"] call lrm_fnc_gear;
	};
//LHD SPAWNING/////////////////////////////////////////////////////////////////////////////////////
// SPAWNING PLAYERS ON THE LHD
//"LHD1" is LHD name

//[LHD1, player] call CUP_fnc_moveInCargo;
//player addMPEventhandler ["MPRespawn", {[Normandy, (_this select 0)] call CUP_fnc_moveInCargo;}];
//BRIEFING ////////////////////////////////////////////////////////////////////////////////////////
// Hidden Briefing extras - Selected individuals can see thisList
// Put T1, T2, T3, T4, T5 into the 2 Zeus slots, Company Commander, and 2 Platoon Commanders

/*
if (((vehicleVarName player) == "T1")||((vehicleVarName player) == "T2")||((vehicleVarName player) == "T3")||((vehicleVarName player) == "T4")||((vehicleVarName player) == "T5")) then {
  [] execVM "briefing\briefing_secret.sqf";
  hint "success";
}
else {};
[] execVM "briefing\briefing.sqf"; // Standard Briefing - Everyone can see this
*/
// DYNAMIC GROUPS//////////////////////////////////////////////////////////////////////////////////
//Y'know that 'press U to join/rename/create/leave groups' menu? This starts that clientside and intialises the group.
["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
//JIP ZUES FIX/////////////////////////////////////////////////////////////////////////////////////
//[] execVM "scripts\JIPZeusAssign.sqf"; //unknown if still required, additional function
//SERVER FPS MONITOR///////////////////////////////////////////////////////////////////////////////
// Turn into an AAF CBA keybinding for ease of use.
//_monitor = [] execVM "scripts\fpsmon.sqf"; //example to turn on
//terminate _monitor; //example to turn off
