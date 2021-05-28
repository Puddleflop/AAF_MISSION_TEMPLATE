#include "..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
starts the auto save feature of LRM

parameters:
None

Returns:
None

Example:
[] call AAF_fnc_LRMInit;
-------------------------------------------------------------------------------------------------*/
params[];
if (LRMPLAYERSAVE) then {
    [{
        _this = database;
        if !(count ("getSections" call database) == 0) then {
            [database] call aaf_fnc_startload;
        };
    }, [database], 1] call CBA_fnc_waitandexecute;

    [{
        _playerSaveHandler = [{
            [_args select 0] call aaf_fnc_startSave; 
        } , 300, [database]] call CBA_fnc_addPerFrameHandler;
    }, [database], 5] call CBA_fnc_waitandexecute;
};

_mapLocations = nearestLocations [[worldsize/2, worldsize/2, 0], ["Airport", "NameLocal", "CityCenter", "HistoricalSite", "NameCity", "NameCityCapital", "NameVillage"], worldsize];
allLocations = [];
{ 
 	allLocations append [[text _x, _x]];
} forEach _mapLocations