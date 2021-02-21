///////////////////////////////////////////////////////////////////////////////////////////////////
// AAF Intro Function for clients
///////////////////////////////////////////////////////////////////////////////////////////////////
//Should all this be in init.sqf ?
waituntil {time > 0}; //Wait until mission started: ??
if (!isServer && (player != player)) then {
	waitUntil { player == player };
	waitUntil { time > 10 };
};
if  (time > 300) exitwith {}; //JiP check

player enableSimulation false; //disables player simulation
systemchat "Hands and feet inside the Bus";//"PlayerSim BEGONE !"; //debug
//IGNORE ME ///////////////////////////////////////////////////////////////////////////////////////
/*
[
"Operation Nemesis", //0: STRING - Name of the mission.  SemiBold font under date during sitrep typing effect. Default: "An Arma 3 mission"
"November 7", //1: STRING - Author of the mission.  Displayed under the mission name in medium font. Use a " " for nothing. Default: "by a Community Author"
"Monty", //2: STRING - Version of the mission.  Displayed under the mission author in a medium font. Use a " " for nothing. Default: "Version 1.0"
"November 7's first Operation \n\n This is a Historical N7 Operation", //3: STRING - Quote for center screen display on black screen.  Default: "Not so long ago, not so far away...\n\n-A quote"
10 //4: NUMBER - Duration of quote display.  Default: 9
] execVM "intro\missionIntro.sqf"; //blackscreen fade mission intro
*/
//INTRO ///////////////////////////////////////////////////////////////////////////////////////////
[
	player, //Camera Location
	"Operation Nemesis",//Missionname
	50, //(optional) Altitude (in meters)
	25, // (optional) Radius of the circular movement (in meters)
	75, //Viewing angle (in degrees)
	1, //Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
	[], //iconOptions: Array - Each array in format:
	0, //0: normal (default), 1: world scenes
	true, //Fade in after completion (default: true)
	65 // Wait time in seconds after the shot has been completed (Since Arma 3 1.81)
] spawn BIS_fnc_establishingShot;//spinning camera
//RscPictureKeepAspect

for "_i" from 1 to 60 do { //120second timer
	//systemChat str _i;//debug
	sleep 1;
};

player enableSimulation true;
systemchat "You Can Move Now !";//"PlayerSim ACTIVATE !!"; //debug
