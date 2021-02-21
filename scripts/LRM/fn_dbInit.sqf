#include "..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
LRM db init

parameters:
None

Returns:
The database that is created <CODE>

Example:
[] call AAF__lrm_fnc_DBinit;
-------------------------------------------------------------------------------------------------*/
params[];
private _playerUID = getplayerUID player;
private _databaseName = LRMNAME + _playerUID;
private _lrmGearDB = ["new", _databaseName] call OO_inIDBI;
_lrmGearDB