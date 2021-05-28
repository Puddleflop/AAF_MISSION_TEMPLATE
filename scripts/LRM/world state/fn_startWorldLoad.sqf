#include "..\..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
Begins the loading Process for a save

parameters:
0: _database <CODE>: The database for the Save to be loaded from.
Returns:
nothing

Example:
[] call AAF_fnc_startWorldLoad;
-------------------------------------------------------------------------------------------------*/
params["_database"];

private _sections = "getSections" call _database;
private _numberSections = count _sections;
private _currentSave = _numberSections - 1;
private _section = _sections select _currentSave;

private _missionState = ["read", [_section, "worldState"]] call _database;

setDate _missionState select 0;
setFog _missionState select 1;
setRain _missionState select 2;
_missionWind = _missionState select 3;
setWind [_missionWind select 0, _missionWind select 1, false];
setOvercast _missionState select 4;
setLightnings _missionState select 5;
