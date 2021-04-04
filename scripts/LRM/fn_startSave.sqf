#include "..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
Begins the saving process for a save

parameters:
0: _database <CODE>: The database for the Save to be saved to.

Returns:
nothing

Example:
[] call AAF_fnc_startSave;
-------------------------------------------------------------------------------------------------*/
params ["_database"];

private _section = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];
try {
    if (LRMPLAYERPOSITIONSAVE) then {
        // Position
        _playerPos = getPos player;
        _playerStance = stance player;
        _playerInfo = [_playerPos, _playerStance];
        ["write", [_section, "position", _playerInfo]] call _database;
    };
    if (LRMPLAYERMEDICALSAVE) then {
        // Medical
        if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
            private _unit = player;
            // - Blood and heart ----------------------------------------------------------
            playerBloodVol = _unit getVariable ["ace_medical_bloodVolume", 6.0];
            playerHeartRate = _unit getVariable ["ace_medical_heartRate", 80];
            playerBloodPressure = _unit getVariable ["ace_medical_bloodPress", [80, 120]];
            playerPeripheralresistance = _unit getVariable ["ace_medical_peripheralResistance", 100];
            playerinCardiacArrest = _unit getVariable ["ace_medical_inCardiacArrest", false];
            playerHemorrhage = _unit getVariable ["ace_medical_hemorrhage", 0];
            
            playerBloodHeartArray = [playerBloodVol, playerHeartRate, playerBloodPressure, playerPeripheralresistance, playerinCardiacArrest, playerHemorrhage];
            
            // - Pain ---------------------------------------------------------------------
            playerPain = _unit getVariable ["ace_medical_pain", 0];
            playerinPain = _unit getVariable ["ace_medical_inPain", false];
            playerPainSupp = _unit getVariable ["ace_medical_painSuppress", 0];
            
            playerPainArray = [playerPain, playerinPain, playerPainSupp];
            
            // - Wounds -------------------------------------------------------------------
            playerOpenWounds = _unit getVariable ["ace_medical_openWounds", []];
            playerBandagedWounds = _unit getVariable ["ace_medical_bandagedWounds", []];
            playerStitchedWounds = _unit getVariable ["ace_medical_stitchedWounds", []];
            playerIsLimping = _unit getVariable ["ace_medical_isLimping", false];
            playerFractures = _unit getVariable ["ace_medical_fractures", [0, 0, 0, 0, 0, 0]];
            
            playerWoundArray = [playerOpenWounds, playerBandagedWounds, playerStitchedWounds, playerIsLimping, playerFractures];
            
            // - Misc ---------------------------------------------------------------------
            playerIsUnconscious = _unit getVariable ["ACE_isUnconscious", false];
            
            // - Treatments ---------------------------------------------------------------
            playertourniquets = _unit getVariable ["ace_medical_tourniquets", [0, 0, 0, 0, 0, 0]];
            playerOccludedMedications = _unit getVariable ["ace_medical_occludedMedications", nil];
            playerIvBags = _unit getVariable ["ace_medical_ivBags", nil];
            
            playerTreatmentArray = [playertourniquets, playerOccludedMedications, playerIvBags];
            
            // Triage card and logs
            playerTriageLevel = _unit getVariable ["ace_medical_triageLevel", 0];
            playerTriageCard = _unit getVariable ["ace_medical_triageCard", []];
            
            // damage storage
            playerBodyPartdamage = _unit getVariable ["ace_medical_bodyPartdamage", [0, 0, 0, 0, 0, 0]];
            
            // Medication
            playerMedications = _unit getVariable ["ace_medical_Medications", []];
            
            // Unconscious spontanious wake up chance
            playerLastWakeUpCheck = _unit getVariable ["ace_medical_lastWakeUpCheck", nil];
            
            playerMedicalArray = playerBloodHeartArray + playerPainArray + playerWoundArray + [playerIsUnconscious] + playerTreatmentArray + [playerTriageLevel, playerTriageCard, playerBodyPartdamage, playerMedications, playerLastWakeUpCheck, playerStateMachine];
            
            ["write", [_section, "medical", playerMedicalArray]] call _database;
        } else {
            playerdamage = damage player;
            ["write", [_section, "medical", playerdamage]] call _database;
        };
    };
    if (LRMPLAYERGEARSAVE) then {
        // Gear
        _playerLoadout = getUnitLoadout player;
        ["write", [_section, "Gear", _playerLoadout]] call _database;

        if !(isnil "acre_api_fnc_getCurrentradiolist") then {
            _playerRadios = [] call acre_api_fnc_getCurrentRadioList;
            _playerRadioList = [];
        
            {
                // Saves the radio settings
                _channel = [_x] call acre_api_fnc_getradioChannel;
                _volume = [_x] call acre_api_fnc_getradioVolume;
                _spatial = [_x] call acre_api_fnc_getradioSpatial;
                _radioProperties = [_channel, _volume, _spatial];
                _playerRadiolist append [_radioProperties];
            } forEach _playerRadios;
            ["write", [_section, "radio", _playerRadiolist]] call _database;
        };
    };

    hint str format["Current State Saved | %1", _section];

} catch {
    hintSilent str _exception;
};