// INIT PLAYER LOCAL //////////////////////////////////////////////////////////////////////////////
/*
	- Executed locally when player joins mission (includes both mission start and JIP).
*/
//HEADLESS CHECK///////////////////////////////////////////////////////////////////////////////////
if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.

waituntil {getplayeruid player != ""};//For uid locked scripts / abilities
waituntil {not isnil "lrm_mission_name"}; //Waits until the server has broadcast the mission name.
//PLAYER LRM THINGS ///////////////////////////////////////////////////////////////////////////////
//[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory; //Save player loadout for respawn
//BIS_fnc_deleteInventory
//BIS_fnc_saveInventory
//BIS_fnc_loadInventory
// RADIOS

if (!(lrm_mission_name isEqualTo "LRM_DEFAULT")) then { //if not LRM run save gear function
	_LRMname = missionName;
	_savedLRMname = profilenamespace getvariable ["LRMname","nothing"];
	if ((str _savedLRMname) == (str _LRMname))
	then {
		SystemChat "you have been here before";
	} else {
		SystemChat "you are not from around here";
		profileNamespace setVariable ["LRMname",_LRMname];
		["LRM_Initial_Loadout","save"] call lrm_fnc_gear;
	};
};
//JIP ZUES FIX////////////////////////////////////////////////////////////////////////////////////
//[] execVM "scripts\JIPZeusAssign.sqf"; // Still Needed ?
//[] execVM "scripts\Zues_eventhandler.sqf"; //Zues EventHandler //REMOVED FOR CHOICE AND CONTROL
//PLAYER DYNAMIC SIMULATION FIX///////////////////////////////////////////////////////////////////
player enableDynamicSimulation false;
player triggerDynamicSimulation true;
//DYNAMIC GROUPS//////////////////////////////////////////////////////////////////////////////////
// Initializes the player/client side Dynamic Groups framework and registers the player group
["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework
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
//PLAYER LRM THINGS - DO NOT TOUCH ////////////////////////////////////////////////////////////////
medGlobalvars = [ //Med variables that need to be global.
	"ace_medical_pain",
	"ace_medical_morphine",
	"ace_medical_bloodVolume",
	"Ace_isUnconscious",
	"ace_medical_tourniquets",
	"ace_medical_openWounds",
	"ace_medical_bandagedWounds",
	"ace_medical_internalWounds",
	"ace_medical_lastUniqueWoundID",
	"ace_medical_fractures",
	"ace_medical_triageLevel",
	"ace_medical_triageCard",
	"ace_medical_ivBags",
	"ace_medical_bodyPartStatus",
	"ace_medical_addedToUnitLoop",
	"ace_medical_inCardiacArrest",
	"ace_medical_hasLostBlood",
	"ace_medical_isBleeding",
	"ace_medical_hasPain",
	"ace_medical_painSuppress",
	"ace_medical_inReviveState"
];
medLocalvars = [ //Med variables that only need to be local.
	"ace_medical_heartRate",
	"ace_medical_heartRateAdjustments",
	"ace_medical_bloodPressure",
	"ace_medical_peripheralResistance",
	"ace_medical_reviveStartTime"
];
lrm_fnc_init = compile preprocessFile "lrm\init.sqf";
lrm_fnc_respawn = compile preprocessFile "lrm\respawn.sqf";
lrm_fnc_load = compile preprocessFile "lrm\load.sqf";
lrm_fnc_saveloop = compile preprocessFile "lrm\saveloop.sqf";
if (lrm_mission_name != "LRMDEFAULT") then {[] spawn lrm_fnc_init}; // if LRM, save loop starts
//SIMULATION EVENTHANDLER //////////////////////////////////////////////////////////////////////////
//Inventory Eventhandler
//this addEventHandler ["InventoryOpened", {
//params ["_unit", "_container"];
//}];
//unit: Object - Object the event handler is assigned to
//targetContainer: Object - connected container or weaponholder
//secondaryContainer: Object - second connected container or weaponholder or objNull

//this addEventHandler ["InventoryClosed", {
//	params ["_unit", "_container"];
//}];
//unit: Object - Object the event handler is assigned to
//targetContainer: Object - connected container or weaponhold
