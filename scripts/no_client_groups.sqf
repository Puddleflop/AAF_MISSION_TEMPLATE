// periodically transfers ownership of any AI groups to the server
while (true) do {
	{
		if (groupOwner _x > 2) {
			if ({isplayer _x} count (units _x) == 0) then {
				_x setGroupOwner -1;
			};
		}
	} forEach allGroups;
	
	sleep 100;
}
