///////////////////////////////////////////////// scripts
// deletes bodies after X seconds
//		1 hour: 3600
//		30 minutes: 1800
//		10 minutes: 600
//		1 minute: 60
30 execvm "scripts\no_dead_bodies.sqf";

// deletes dropped gear after X seconds
30 execvm "scripts\no_random_gear.sqf";

// transfers ownership of any AI groups to the server
execvm "scripts\no_client_groups.sqf";

// deletes the player body when they disconnect
// execvm "scripts\no_discon_bodies.sqf";

// deletes empty groups
execvm "scripts\no_empty_groups.sqf";

// shares limited target information between AI groups
execvm "scripts\ai_radioshare.sqf";

// updates AI skill to Rommels desired values every X seconds
30 execvm "scripts\ai_skill.sqf";

// refuels/rearms AI vehicles every X seconds
600 execvm "scripts\ai_resupply.sqf";

// ambient civilians (can be "afro", "euro", "asia", "tanoan" or "" (everything))
// "tanoan" execvm "scripts\tpw.sqf";

// players can dynamically change their groups
execvm "scripts\dynamic_groups.sqf";

///////////////////////////////////////////////// settings (for mods etc)
// optional: disable/enable VCOM AI (disabled: false, enabled: true)
Vcm_ActivateAI = false;
publicvariable "Vcm_ActivateAI";

aaf_disable_postinit = true;
publicvariable "aaf_disable_postinit";

///////////////////////////////////////////////// settings (for LRM template)
// this function runs when a player spawns (on DEATH, or on first JOIN, aka, mission start or JIP, but not thereafter)
lrm_fnc_on_respawn = {
	// adds the player's loadout from the `this setvariable ["sut_loadout", ...]`
	// initialisation line on each player unit in the editor
	// 		false: no backpack (short mission)
	//		true: long range patrol (++mags, aka LRM)
	[player, player getvariable ["sut_loadout", "rifleman"], true] call compile preprocessfilelinenumbers "loadouts\usmc42.sqf";
};
publicvariable "lrm_fnc_on_respawn";

// sets the respawn timer after death (overrides the mission configuration)
lrm_respawn_timer = 999999;
publicvariable "lrm_respawn_timer";

// forces spectator for player after X deaths (typically 1-3)
lrm_max_deaths = 99999;
publicvariable "lrm_max_deaths";

// IGNORE: a unique mission name is required to prevent player state carrying between missions
// lrm_mission_name = "rsut_";
lrm_mission_name = str (random 100000);
publicvariable "lrm_mission_name";

///////////////////////////////////////////////// MISSION SPECIFIC
