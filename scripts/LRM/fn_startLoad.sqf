#include "..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
Begins the loading Process for a save

parameters:
0: _database <CODE>: The database for the Save to be loaded from.

Returns:
nothing

Example:
[] call AAF_fnc_startload;
-------------------------------------------------------------------------------------------------*/
params["_database"];

private _sections = "getSections" call _database;
private _numberSections = count _sections;
try {
    private _currentSave = _numberSections - 1;
    private _section = _sections select _currentSave;
    
    // Medical
    if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
        playerMedicalArray = ["read", [_section, "medical"]] call _database;
        private _unit = player;
        
        // Blood and heart
        _unit setVariable ["ace_medical_bloodVolume", playerMedicalArray select 0, true];
        _unit setVariable ["ace_medical_heartRate", playerMedicalArray select 1, true];
        _unit setVariable ["ace_medical_bloodPress", playerMedicalArray select 2, true];
        _unit setVariable ["ace_medical_peripheralresistance", playerMedicalArray select 3, true];
        _unit setVariable ["ace_medical_hemorrhage", playerMedicalArray select 5, true];
        
        // Pain
        _unit setVariable ["ace_medical_pain", playerMedicalArray select 6, true];
        _unit setVariable ["ace_medical_inPain", playerMedicalArray select 7, true];
        _unit setVariable ["ace_medical_painSuppress", playerMedicalArray select 8, true];
        
        // Wounds
        _unit setVariable ["ace_medical_openWounds", playerMedicalArray select 9, true];
        _unit setVariable ["ace_medical_bandagedWounds", playerMedicalArray select 10, true];
        _unit setVariable ["ace_medical_stitchedWounds", playerMedicalArray select 11, true];
        _unit setVariable ["ace_medical_isLimping", playerMedicalArray select 12, true];
        _unit setVariable ["ace_medical_fractures", playerMedicalArray select 13, true];
        
        // Treatments
        _unit setVariable ["ace_medical_tourniquets", playerMedicalArray select 15, true];
        _unit setVariable ["ace_medical_occludedMedications", playerMedicalArray select 16, true];
        // Delayed Medications (from tourniquets)
        _unit setVariable ["ace_medical_ivBags", playerMedicalArray select 17, true];
        
        // Triage card and logs
        _unit setVariable ["ace_medical_triageLevel", playerMedicalArray select 18, true];
        _unit setVariable ["ace_medical_triageCard", playerMedicalArray select 19, true];
        
        // damage storage
        _unit setVariable ["ace_medical_bodyPartdamage", playerMedicalArray select 20, true];
        
        // Medication
        _unit setVariable ["ace_medical_Medications", playerMedicalArray select 21, true];
        
        // Unconscious spontanious wake up chance
        _unit setVariable ["ace_medical_lastWakeUpCheck", playerMedicalArray select 22];
        
        // Misc
        [_unit, playerMedicalArray select 14] call ace_medical_status_fnc_setUnconsciousState;
        [_unit, playerMedicalArray select 4] call ace_medical_status_fnc_setCardiacArrestState;
        
        // Update wound bleeding
        [_unit] call ace_medical_status_fnc_updateWoundBloodLoss;
        [_unit] call ace_medical_engine_fnc_updatedamageEffects;

    } else {
            player setDamage ["read", [_section, "medical"]] call _database;
    };

    // Position
    private _playerInfo = ["read", [_section, "position"]] call _database;
    _playerPos = _playerInfo select 0;
    player setPos _playerPos;
    switch (_playerInfo select 1) do
    {
        case "STAND":{
           player playAction "PlayerStand"; 
        };
        case "PRONE":{
            player playAction "PlayerProne";
        };
        case "MIDDLE":{
            player playAction "PlayerCrouch";
        };
    };

    // Gear
    player setUnitLoadout (configFile >> "Emptyloadout");
    _playerloadout = ["read", [_section, "gear"]] call _database;
    player setUnitLoadout _playerloadout;
    private _loadradios = [_database, _section] call AAF_fnc_loadradios;
    
    // Radios
    if !(isnil "acre_api_fnc_getCurrentradiolist") then {
        private _playerRadioList = call acre_api_fnc_getCurrentradiolist;
        if !(count _playerRadioList == 0) then {
            try {
                _playerradios = ["read", [_section, "radio"]] call _database;
                {
                    // loads the radio settings
                    _currentradiosettings = _playerradios select _forEachindex;
                    [_x, _currentradiosettings select 0] call acre_api_fnc_setradioChannel;
                    [_x, _currentradiosettings select 1] call acre_api_fnc_setradioVolume;
                    [_x, _currentradiosettings select 2] call acre_api_fnc_setradioSpatial;
                } forEach _playerRadioList;
                _success = true;
            } catch {
                _success = false;
            };
        };
    };
    hintSilent format["Save loaded | %1", _section];

} catch {
    hintSilent str _exception;
    private _unit = player;
    forceRespawn _unit;
    deletevehicle _unit;
};
