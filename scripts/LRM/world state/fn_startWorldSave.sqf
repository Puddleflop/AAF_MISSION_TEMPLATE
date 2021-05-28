#include "..\..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
Begins the saving process for a save

parameters:
0: _database <CODE>: The database for the Save to be saved to.

Returns:
nothing

Example:
[] call AAF_fnc_startWorldSave;
-------------------------------------------------------------------------------------------------*/
params["_database"];

private _section = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];

private _missionDate = date;
private _missionFog = fog;
private _missionRain = rain;
private _missionWind = wind;
private _missionOvercast = overcast;
private _missionLightnings = lightnings;
private _missionState = [_missionDate, _missionFog, _missionRain, _missionWind, _missionOvercast, _missionLightnings];

["write", [_section, "worldstate", _missionState]] call _database;