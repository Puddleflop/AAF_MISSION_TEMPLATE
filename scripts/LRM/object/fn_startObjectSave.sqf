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
[] call AAF_fnc_startObjectSave;
-------------------------------------------------------------------------------------------------*/
params["_database"];
if(LRMOBJSAVE) then {
	private _section = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];

	_worldMap = createHashMap;

	_gridNumber = (worldsize - (worldSize mod 1000))/1000;

	_objects = allMissionObjects "thing";
	_objects append allMissionObjects "house";

	{
		_pos = getPos _x;
		_grid = [round((_pos select 0)/1000), round((_pos select 1)/1000)];

		_gridArray = _worldMap getOrDefault [_grid, []];

		_object = [typeof _x, _pos];
		_gridArray pushBack _object;

		_worldMap set [_grid, _gridArray];

	} forEach _objects;

	["write", [_section, "objects", _worldMap]] call _database;
}

