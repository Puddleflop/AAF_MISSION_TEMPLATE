execvm "lrm\init.sqf";

// prevent ACRE from being extremely difficult at times
execvm "scripts\non_shit_acre.sqf";

// BLUFOR tracking, updates every X seconds (for groups of side Y)
[60, west] execvm "scripts\blufor_tracker.sqf";

// enable AAF medical (chance of random death)
execvm "scripts\aaf_medical.sqf";

// players can dynamically change their groups
execvm "scripts\dynamic_groups.sqf";

// periodically resets a players rating
execvm "scripts\no_player_rating.sqf";
