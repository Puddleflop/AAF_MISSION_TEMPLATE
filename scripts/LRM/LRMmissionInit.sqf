#include "..\..\missionSettings.hpp"
/*-------------------------------------------------------------------------------------------------
Author: AAF

Description:
stats the auto save feature of LRM

-------------------------------------------------------------------------------------------------*/
saving = true;
waitUntil {
    time > 5
};
if (LRMPLAYERSAVE) then {
    [{
        _this = database;
        if !(count ("getSections" call database) == 0) then {
            [database] call aaf_fnc_startload;
        };
    }, [database], 1] call CBA_fnc_waitandexecute;
    while {saving} do {
        [{
            _this = database;
            [_this] call aaf_fnc_startSave;
    }, [database], 300] call CBA_fnc_waitandexecute;
    };
};