private _state_g = [
	{ getposatl player; },
	{ getdir player; },
	{ animationstate player; }
];

private _state_s = [
	{ player setposatl _this; },
	{ player setdir _this; },
	{
		player switchmove _this;
		player playmovenow _this;

		_this spawn {
			sleep 10;

			if (animationstate player == _this) then {
				player switchmove "";
			};
		};
	}
];

[_state_g, _state_s];
