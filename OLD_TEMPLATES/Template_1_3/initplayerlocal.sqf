if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.


//For uid locked scripts / abilities
waituntil {getplayeruid player != ""};

////////////////////////////////////////////////////////////////////////////////////////////////
// LRM Things - No touchy touchy
////////////////////////////////////////////////////////////////////////////////////////////////
medGlobalvars = [
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
//Med variables that need to be global.

medLocalvars = [
	"ace_medical_heartRate",
	"ace_medical_heartRateAdjustments",
	"ace_medical_bloodPressure",
	"ace_medical_peripheralResistance",
	"ace_medical_reviveStartTime"
];
//Med variables that only need to be local.

lrm_fnc_save_pers = compile preprocessFile "functions\fn_CreateMissionSQF.sqf";
lrm_fnc_load_pers = compile preprocessFile "functions\fn_LRMLoad.sqf";

["AAF", "LRM save", { [] spawn lrm_fnc_save_pers; }] call Ares_fnc_RegisterCustomModule;
["AAF", "LRM Load", { [] spawn lrm_fnc_load_pers; }] call Ares_fnc_RegisterCustomModule;
//   {_x allowDamage false;} foreach curatorEditableObjects MontyZeus;


waituntil {not isnil "lrm_mission_name"}; //Waits until the server has broadcast the mission name.
//Note this isn't required now, could just define the mission name on the player side and do it per mission, but if in the future we move to a mod setup using modules it'll be easier if this is serverside.

//Starts LRM scripting
lrm_fnc_init = compile preprocessFile "lrm\init.sqf";
lrm_fnc_respawn = compile preprocessFile "lrm\respawn.sqf";
lrm_fnc_load = compile preprocessFile "lrm\load.sqf";
lrm_fnc_saveloop = compile preprocessFile "lrm\saveloop.sqf";
if (lrm_mission_name != "LRMDEFAULT") then {[] spawn lrm_fnc_init};
