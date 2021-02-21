///////////////////////////////////////////////////////////////////////////////////////////////////
// AAF Intro Function for clients
///////////////////////////////////////////////////////////////////////////////////////////////////
//Should all this be in initplayerlocal.sqf ?
waituntil {time > 0}; //Wait until mission started
if (!isServer && (player != player)) then {
	waitUntil { player == player };
	waitUntil { time > 10 };
};
//EXIT CONDITIONS /////////////////////////////////////////////////////////////////////////////////
//if (time > 300) exitwith {}; //JiP check //remove ??
_adminstate = 0;//predefine for sanitys sake
_adminState = call BIS_fnc_admin; //will return 0, 1, 2
if (_adminState > 0) exitwith {};//if 1 or 2, exit
publicVariable "AAF_Intro";//get variable
if (AAF_Intro) exitwith {};//check variable
player enableSimulation false;
systemchat "Hands and feet inside the Bus";//debug
[
	player, //Camera Location
	briefingName,//"Operation Nemesis Phase 2",
	50, //(optional) Altitude (in meters)
	25, // (optional) Radius of the circular movement (in meters)
	75, //Viewing angle (in degrees)
	1, //Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
	[], //iconOptions: Array - Each array in format:
	0, //0: normal (default), 1: world scenes
	true, //Fade in after completion (default: true)
	60 // Wait time in seconds after the shot has been completed (Since Arma 3 1.81)
] spawn BIS_fnc_establishingShot;//spinning camera

for "_i" from 1 to 60 do { //60 second timer
	//systemChat str _i;//debug
	sleep 1;
};
player enableSimulation true;
systemchat "You Can Move Now !";//debug
