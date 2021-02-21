///////////////////////////////////////////////////////////////////////////////////////////////////
// AAF Intro Function for server
///////////////////////////////////////////////////////////////////////////////////////////////////
waituntil {time > 0}; //Wait until mission started: ??

enableDynamicSimulationSystem false; //disables if left active
systemchat "Server preparing";//"Dynasim BEGONE !"; //debug

for "_i" from 1 to 60 do { // 120second timer
	//systemChat str _i; //debug
	sleep 1;
};

//then dynamic sim activate
enableDynamicSimulationSystem true; //Toggles the Dynamic Simulation system.
systemchat "Server Prepped !";//"Dynasim ACTIVATE !!"; //debug
