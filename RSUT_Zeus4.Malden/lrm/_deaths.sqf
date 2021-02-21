if (isnil "lrm_deaths_fnc_killed") then {
	lrm_deaths_fnc_handle = {
		waituntil {not isnil "lrm_max_deaths"};

		if (lrm_deaths >= lrm_max_deaths) exitwith {
			if (alive player) then {
				player setdamage 1;
				deletevehicle player;
			};

			systemchat "You are MIA. (spectator only)";
		};

		waituntil {not isnil "lrm_respawn_timer"};
		setPlayerRespawnTime lrm_respawn_timer;
		systemchat ("Re-deploying in " + (str playerRespawnTime) + " seconds");
	};

	lrm_deaths_fnc_killed = {
		["Initialize", [player, [], false /* see AI */, false /* free camera */, false /* 3rd person */, false, false, false, false, true /* show entities / locations list */]] call BIS_fnc_EGSpectator;
		setPlayerRespawnTime 999999;

		lrm_deaths = lrm_deaths + 1;
		call lrm_deaths_fnc_handle;
	};

	lrm_deaths_fnc_respawn = {
		["Terminate"] call BIS_fnc_EGSpectator;
		player setCaptive false; // problems!
	};
};

private _state_g = [
	{
		if (isnil "lrm_deaths") then {
			lrm_deaths = 0;
		};

		if (isnil "lrm_deaths_handler") then {
			lrm_deaths_khandler = player addeventhandler ["killed", lrm_deaths_fnc_killed];
			lrm_deaths_rhandler = player addeventhandler ["respawn", lrm_deaths_fnc_respawn];
		};

		lrm_deaths;
	}
];

private _state_s = [
	{
		lrm_deaths = _this;
		lrm_deaths spawn lrm_deaths_fnc_handle;
	}
];

[_state_g, _state_s];
