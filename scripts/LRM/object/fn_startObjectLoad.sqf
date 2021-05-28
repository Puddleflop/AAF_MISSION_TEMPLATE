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
[] call AAF_fnc_startObjectLoad;
-------------------------------------------------------------------------------------------------*/
params["_database"];

if(LRMOBJSAVE) then {
    private _sections = "getSections" call _database;
    private _numberSections = count _sections;
    try {
        private _currentSave = _numberSections - 1;
        private _section = _sections select _currentSave;

        _worldMap = ["read", _section] call _database;
    };

    _worldMap
}

