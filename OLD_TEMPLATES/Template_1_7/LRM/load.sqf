/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
 If the lrm_fnc_init determines the player has played before, this script will load that previous data and then call the lrm saving loop.  Eventually there will need to be check to see if the player has connected after they have used up all their lives, and load into a spectator mode.
 // Going to need to check if the player was saved in a vehicle, eventually.

Parameters:
 none

Returns:
 nothing

Example:
 none
-------------------------------------------------------------------------------------------------*/
_savedtime = profileNamespace getvariable ["lrm_saved_time", 0]; //Using this for time sensitive variables, like torniquets, revive time.

//Loading their saved gear.
["LRM_Current_Loadout","load"] call aaf_fnc_gear;

lrm_player_loc = profileNamespace getvariable ["lrm_player_loc",nil];
player setposATL (lrm_player_loc select 0);
player setdir (lrm_player_loc select 1);

If !(profileNamespace getVariable ["ace_isUnconscious",false]) then {
	player switchmove (lrm_player_loc select 2);
	player playmovenow (lrm_player_loc select 2);
};
//Loads player position, facing and stance.
//Checks if the player was in the unconscious state last save. If they were, it does not load their previous animation, ACE will handle it when medical is loaded.

//Medical /////////////////////////////////////////////////////////////////////////////////////////
//REPLACE WITH IF BLEEDING > 0 DEAD
/*
private "_result";
_result = [];
{ _result pushback [_x, profileNamespace getvariable _x]; } forEach medGlobalvars;
{ player setvariable [_x select 0, _x select 1, true]; } forEach _result;

//Makes a multidimensional array consisting of [variablename,value], then feeds that one by one into a global setvariable
_result = [];
{ _result pushback [_x, profileNamespace getvariable _x]; } forEach medLocalvars;
{ player setvariable [_x select 0, _x select 1]; } forEach _result;

//As above, but for the few medical variables that can be kept local.
//Need a special case for tourniquets, so people don't pass out from pain if they logged off with tourniquets on.
_result = [];
{
	if (_x > 0) then {
		_x = CBA_missionTime - (_savedtime - _x);
		if (_x <= 0) then {_x = 1}; //Tourniquets can't be negative.
		_result pushback _x;
	} else { _result pushback 0; };
} forEach (profileNamespace getVariable ["ace_medical_tourniquets", [0,0,0,0,0,0]]);
player setvariable ["ace_medical_tourniquets",_result,true];
*/

/*Tourniquets save the time they were applied so they can calculate pain correctly. The position in the array indicates which limb. A typical tourniquets array looks like [0,0,0,810,813,0] which would indicate two tourniquets applied at mission time 810 and 813 seconds.
This loop checks if there was a tourniquet (_x > 0), and if there was, it takes the current mission time at load, subtracts how long the tourniquet was on (_savedtime - _x).
If this is negative, i.e. was the tourniquet on longer than the server has currently been running, it sets the tourniquet to 1 as they cannot be negative.
It then assembles a new array of these values, and then applies it to the players tourniquets variable.*/

/*
//Making sure ACE medical looping scripts activate.
//Checks if the player had a vital loop last time. If yes calls the relevent event.
If (player getVariable ["ace_medical_addedToUnitLoop", false]) then {
	player setvariable ["ace_medical_addedToUnitLoop", false,true]; //Because ACE has checks to make sure shit is not already enabled, need to disable it before calling the function to enable it so it switches on properly.
	[player] call ace_medical_fnc_addVitalLoop;
};

player setdammage (profileNamespace getvariable ["lrm_med_Dammage",0]);
//Set their damage. The misspelling is fine.
If (player getVariable ["ace_isUnconscious",false]) then {
	player setvariable ["ace_isUnconscious",false,true];
	[player, true] call ace_medical_fnc_setUnconscious;
};
	//Checks if the player was unconscious. If they were, it will set them to be awake and then call the ace set unconscious function.
	//Doing it this way to get around ACE animation issues.

if (player getvariable ["ace_medical_inCardiacArrest",false]) then {
	player setvariable ["ace_medical_inCardiacArrest",false,true];
	[player] call ace_medical_fnc_setCardiacArrest;
};
	//Checks if they were in cardiac arrest. If they're in it, sets it to false and then calls the function so it initiates properly. I can't capture the time cardiac arrest started, so it'll just have to be reset.


If (player getvariable ["ace_medical_inReviveState",false]) then {
	_reviveStarted = player getvariable ["ace_medical_reviveStartTime", 0]; //Grabs the time at which revive started in previous save.
	_timeInRevive = _savedtime - _reviveStarted;
	player setvariable ["ace_medical_reviveStartTime", (CBA_missionTime - _timeInRevive), true]; //Should set revive time to be current time - difference.
	[player] call ace_medical_fnc_reviveStateLoop;
};
 	//KNOWN ISSUE: If revive start time ends up being a negative number, i.e., they've been in revive longer than the misison has been running from a restart, CPR won't work.

*/
//After loading call the save loop.
call lrm_fnc_saveloop;
