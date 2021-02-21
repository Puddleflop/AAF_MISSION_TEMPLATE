///////////////////////////////////////////////////////////////////////////////////////////////////
// AAF Intro Function for server
///////////////////////////////////////////////////////////////////////////////////////////////////
waituntil {time > 0}; //Wait until mission started: ??
enableDynamicSimulationSystem false;
systemchat "Server preparing";//debug
for "_i" from 1 to 60 do { //60 second timer
	//systemChat str _i; //debug
	sleep 1;
};
enableDynamicSimulationSystem true;//Toggles the Dynamic Simulation system.
systemchat "Server Prepped !";//debug
AAF_Intro = true; //Intro process intro complete variable setting
publicVariable "AAF_Intro";//broadcasts variable
