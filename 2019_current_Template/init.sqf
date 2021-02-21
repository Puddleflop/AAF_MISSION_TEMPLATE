//FOR respawning on the LHD
//"respawn_west" setMarkerPosLocal [markerPos "respawn_West" select 0, markerPos "respawn_West" select 1, 17];

//AAF Revive - random chance of complete death when put into revive state.
//If values aren't defined here they will be set by AAF_Functions
aaf_revive_MinimumRevives = 1; //players will always get at least this many revives.
aaf_revive_MaximumRevives = 5; //Players will always die the next time they're put into revive state, after this many revives.
aaf_revive_ChanceofDeath = [33,50,75,90]; //Chance players will die on their first, second, third, forth+ time they take a chance. The last value repeats, so someone on their 4th through 10th revives will need to roll higher than 90. Good luck.

if !isnil "acre_api_fnc_setLossModelScale" then {
[0.0] call acre_api_fnc_setLossModelScale;
[false] call acre_api_fnc_setInterference;
[true] call acre_api_fnc_setFullDuplex;
[true] call acre_api_fnc_ignoreAntennaDirection;
};
