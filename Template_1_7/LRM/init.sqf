/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
 To be the start of the lrm scripting, to determine if a player has played in this mission before and either load that previous save or start them from scratch and then call the saveloop.
 Checks if there is a saved lrm_mission_name that matches the current mission name (i.e. have they played in this mission before), if yes, it starts the load function. If no it sets the mission name and starts the save loop. I'll need to flesh this init out with setting things like max amount of lives etc.

Parameters:
 none

Returns:
 nothing

Example:
 none
-------------------------------------------------------------------------------------------------*/
if ((profileNamespace getvariable ["lrm_mission_name","nothing"]) == lrm_mission_name) then {
	hintSilent "LRM data found. Please wait while loading.";
	[lrm_fnc_load, [], 10] call CBA_fnc_waitAndExecute;
	sleep 10;
	hintSilent "";
} else {
	profileNamespace setvariable ["lrm_mission_name",lrm_mission_name];
	["LRM_Initial_Loadout","save"] call aaf_fnc_gear; //Save their initial loadout for respawning.
	call lrm_fnc_saveloop;
};
