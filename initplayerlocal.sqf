#include "missionSettings.hpp"
// INIT PLAYER LOCAL //////////////////////////////////////////////////////////////////////////////
/*
	- Executed locally when player joins mission (includes both mission start and JIP).
*/
//HEADLESS CHECK///////////////////////////////////////////////////////////////////////////////////
if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.

waituntil {getplayeruid player != ""};//For uid locked scripts / abilities
//PLAYER DYNAMIC SIMULATION FIX///////////////////////////////////////////////////////////////////
player enableDynamicSimulation false;
player triggerDynamicSimulation true;
//DYNAMIC GROUPS//////////////////////////////////////////////////////////////////////////////////
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework
//GEAR SAVE ///////////////////////////////////////////////////////////////////////////////////////
aaf_fnc_gear = compile preprocessFile "scripts\fn_gear.sqf"; //Gear saving function - dont touch
["LRM_Initial_Loadout","save"] call aaf_fnc_gear;
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
