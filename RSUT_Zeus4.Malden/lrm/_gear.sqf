if (isnil "lrm_gear_fnc_replaceACRE") then {
	lrm_gear_fnc_replaceACRE = {
		if (count _this > 0) then {
			{
				_x params ["_itemName"];
				if ([_itemName] call acre_api_fnc_isRadio) then {
					_x set [0, [_itemName] call acre_api_fnc_getBaseRadio];
				};
			} foreach (_this select 1);
		};
	};
};

private _state_g = [
	{ player getVariable ["sut_loadout", "rifleman"]; },
	{
		private _gul = getUnitLoadout player;

		// replace ACRE radios with base classes
		(_gul select 3) call lrm_gear_fnc_replaceACRE; // uniform
		(_gul select 4) call lrm_gear_fnc_replaceACRE; // vest
		(_gul select 5) call lrm_gear_fnc_replaceACRE; // backpack

		_gul;
	}
];

private _state_s = [
	{ player setVariable ["sut_loadout", _this]; },
	{ player setUnitLoadout _this; }
];

[_state_g, _state_s];
