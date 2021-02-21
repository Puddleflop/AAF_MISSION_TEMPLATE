private _state_g = [
	{
		[
			player getvariable ["ace_isUnconscious", false],
			player getVariable ["ace_medical_medicClass", 0],
			player getUnitTrait "Medic"
		];
	}
];

private _state_s = [
	{
		_this params ["_uncon", "_medical", "_medic"];

		// no time to deal with this, if you disconnect when unconcious, too bad
		if (_uncon) then { player setdamage 1; };

		player setVariable ["ace_medical_medicClass", _medical, true];
		player setUnitTrait ["medic", _medic];
	}
];

[_state_g, _state_s];
