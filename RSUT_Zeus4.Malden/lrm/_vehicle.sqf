private _state_g = [
	{
		private _vehicle = if (vehicle player != player) then {
			vehicle player;
		} else {
			objNull;
		};

		[
			_vehicle,
			assignedvehiclerole player
		];
	}
];

private _state_s = [
	{
		params ["_vehicle", "_position"];
		if (typename _vehicle == "STRING") exitwith {};
		if (not alive _vehicle) exitwith { player switchmove ""; };
		if (count _position == 0) exitwith {};

		switch tolower(_position select 0) do {
			case "driver": {
				player assignasdriver _vehicle;
				player moveindriver _vehicle;
			};
			case "cargo": {
				player assignascargo _vehicle;
				player moveincargo _vehicle;
			};
			case "turret": {
				private _path = _position select 1;

				player assignasturret [_vehicle, _path];
				player moveinturret [_vehicle, _path];
			};
		};
	}
];

[_state_g, _state_s];
