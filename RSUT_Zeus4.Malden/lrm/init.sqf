if (isnil "lrm_fnc_restore") then {
	lrm_fnc_restore = {
		params ["_variable_str", "_setters", "_namespace"];

		private _value = _namespace getvariable _variable_str;
		if (isnil "_value") exitwith {};

		{
			if (not isnil "_x") then {
				_x call (_setters select _foreachindex);
			};
		} foreach _value;
	};
	lrm_fnc_reset = {
		params ["_variable_str", "_namespace", "_public"];
		if (_public) then {_namespace setvariable [_variable_str, nil, _public];}
		else {_namespace setvariable [_variable_str, nil];};
	};
	lrm_fnc_set = {
		params ["_variable_str", "_namespace", "_public", "_value"];
		if (_public) then {_namespace setvariable [_variable_str, _value, _public];}
		else {_namespace setvariable [_variable_str, _value];};
	};
	lrm_fnc_start = {
		params ["_variable_str", "_properties", "_interval", "_namespace", "_public"];

		private _state = [];
		private _previous = str(_namespace getvariable [_variable_str, ""]);

		while {true} do {
			{
				_state set [_foreachindex, call _x];
			} foreach _properties;

			if (str(_state) != _previous) then {
				_previous = str(_state);

				[_variable_str, _namespace, _public, _state] call lrm_fnc_set;
			};

			sleep _interval;
		};
	};
	lrm_fnc_respawn = {
		{_x call lrm_fnc_reset;} foreach lrm_vars;

		player call lrm_fnc_on_respawn;
	};
	lrm_fnc_init = {
		waituntil {not isnil "lrm_mission_name"};
		waituntil {not isnull player};
		waituntil {not isnil "lrm_fnc_on_respawn"};

		lrm_uid = getplayeruid player;
		lrm_vars = [
			["lrm_v_core", profileNamespace, false, 1, "lrm\_core.sqf"],
			["lrm_v_gear", profileNamespace, false, 3, "lrm\_gear.sqf"],
			["lrm_v_variables", profileNamespace, false, 4, "lrm\_variables.sqf"],
			["lrm_v_vehicle_" + lrm_uid, missionNamespace, true, 4, "lrm\_vehicle.sqf"],
			["lrm_v_deaths", profileNamespace, false, 3, "lrm\_deaths.sqf"]
		];

		if ((profileNamespace getvariable ["lrm_mission_name", ""]) != lrm_mission_name) then {
			profileNamespace setvariable ["lrm_mission_name", lrm_mission_name];
			player call lrm_fnc_respawn;
		};

		{
			_x params ["_variable_str", "_namespace", "_public", "_delay", "_script"];

			private _gs = call compile preprocessfilelinenumbers _script;
			if (isnil "_gs") then {
				systemchat str ["error in", _x];
			} else {
				_gs params ["_get", "_set"];
				if (not isnil "_set") then { [_variable_str, _set, _namespace] call lrm_fnc_restore; };
				if (not isnil "_get") then { [_variable_str, _get, _delay, _namespace, _public] spawn lrm_fnc_start; };
			};
		} foreach lrm_vars;

		lrm_handler = player addeventhandler ["respawn", lrm_fnc_respawn];
	};
};

call lrm_fnc_init;
