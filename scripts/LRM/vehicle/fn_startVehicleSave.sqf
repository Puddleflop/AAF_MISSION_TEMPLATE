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
[] call AAF_fnc_startVehicleSave;
-------------------------------------------------------------------------------------------------*/
params["_database"];
private _section = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];

	_worldMap = createHashMap;

	_gridNumber = (worldsize - (worldSize mod 1000))/1000;

	_vehicles = allMissionObjects "air";
	_vehicles append allMissionObjects "landVehicle";

	{
		_pos = getPos _x;
		_grid = [round((_pos select 0)/1000), round((_pos select 1)/1000)];

		_gridArray = _worldMap getOrDefault [_grid, []];
		_crew = fullCrew [_x, "driver", true];
		_crew append fullCrew [_x, "gunner", true];
		_crew append fullCrew [_x, "commander", true];
		_cargo = fullCrew [_x, "cargo", true];
		_groups = createHashMap;
		_groupArray = [];
		{_groupArray pushBackUnique group _x;} forEach _crew;
		{	
			_groupUnits = units _x;
			_groupUnits apply {typeOf _x};
			_groups set [_x, _groupUnits];
		} forEach _groupArray;
		_crew apply {typeOf _x};
		_object = [typeOf _x, _pos, _groups];
		_gridArray pushBack _object;

		_worldMap set [_grid, _gridArray];

	} forEach _vehicles;

	["write", [_section, _worldMap]] call _database;