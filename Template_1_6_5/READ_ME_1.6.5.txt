///////////////////////////////////////////////////////////////////////////////////////////////////
//
// AAF MISSION TEMPLATE NOTES
//
///////////////////////////////////////////////////////////////////////////////////////////////////
Kids, I cannot stress this enough;

SPEND SOME TIME OPTIMIZEING YOUR MISSIONS

Take the time to set dress pieces and flavour as simple objects.  purely visual things that will never be touched ?
disable simulation !

///////////////////////////////////////////////////////////////////////////////////////////////////
SPACE OUT OBJECTIVES
With your virtual AI distance, we can use transport vehicles and Helo's, well we can RTB after each Objective.
Dont have everything packed so tightly together, so everything is constantly awake.

///////////////////////////////////////////////////////////////////////////////////////////////////
VIRTUAL AI DISTANCE
If your virtual AI are set to 5000 and we never see them over 1500, what's the 3500 extra range for ?

///////////////////////////////////////////////////////////////////////////////////////////////////
SERVER MONITOR
FPC Monitor - _script = [] execVM "\scripts\fpsmon.sqf";

//RESPAWN SPECTATOR////////////////////////////////////////////////////////////////////////////////
// Throw this on a trigger that is activated by "Any Player".

tv = Object that the spectator interation is attached to
------------------------------------------------------------------------
nul = [tv] execvm "scripts\addSpectate.sqf";

//IN GAME BRIEFINGS////////////////////////////////////////////////////////////////////////////////
- Manual method for doing in-game briefings (This will replace the ingame modules. When it comes to writing them, it works the same way as doing it via the modules)
	- Uncomment out the code within the initplayerlocal.sqf (Briefing section)
	-scripts -> briefing.sqf
	-scripts -> briefing_secret.sqf
///////////////////////////////////////////////////////////////////////////////////////////////////
CHANGELOG

26.08.2020 Remote Exec Whitelisted
26.08.2020 Commnds WhileListed
26.08.2020 AAF_AIskill disabled
