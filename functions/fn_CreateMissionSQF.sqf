Ares_EditableObjectBlacklist = [
	"ModuleCurator_F",
	"GroundWeaponHolder",
	"Salema_F",
	"Ornate_random_F",
	"Mackerel_F",
	"Tuna_F",
	"Mullet_F",
	"CatShark_F",
	"Rabbit_F",
	"Snake_random_F",
	"Turtle_F",
	"Hen_random_F",
	"Cock_random_F",
	"Cock_white_F",
	"Sheep_random_F",
	"HeadlessClient_F", // Headless
	"_logic", // Headless
	//LHD Parts
	"B_UAV_AI", // CIWS Crew
	"CUP_LHD_elev_1",
	"CUP_LHD_Light",
	"CUP_B_LHD_WASP_USMC_Empty",
	"CUP_LHD_Int_2",
	"CUP_LHD_1",
	"babe_helper",
	"Sign_Arrow_Green_F",
	"Sign_Arrow_F",
	"Sign_Arrow_Yellow_F",
	"Land_CUP_Frigate_Ladders",
	"HeliH",
	"CUP_LHD_Light_Green",
	"CUP_LHD_7",
	"CUP_LHD_elev_2",
	"CUP_LHD_Int_3",
	"CUP_LHD_Int_1",
	"CUP_LHD_6",
	"CUP_LHD_house_2",
	"CUP_LHD_5",
	"CUP_LHD_house_1",
	"CUP_LHD_4",
	"CUP_LHD_3",
	"CUP_LHD_2",
	"CUP_WV_B_Phalanx",
	"CUP_WV_B_SS_Launcher_naval",
	"CUP_WV_B_RAM_Launcher_naval",
	"ACE_friesAnchorBar"
];

_radius = -1;//100;  TO ENABLE ALL OF MAP NO MATTER WHAT
_includeUnits = true;//if (_dialogResult select 1 == 0) then { true; } else { false; }; // AUTO INCLUDE
_includeEmptyVehicles = true;//if (_dialogResult select 2 == 0) then { true; } else { false; }; // AUTO INCLUDE
_includeEmptyObjects = true;//if (_dialogResult select 3 == 0) then { true; } else { false; }; // AUTO INCLUDE
_includeMarkers = true;//if (_dialogResult select 4 == 0) then { true; } else { false; }; // AUTO INCLUDE

_objectsToFilter = curatorEditableObjects (getAssignedCuratorLogic player);
_emptyObjects = [];
_emptyVehicles = [];
_groups = [];
{
	_ignoreFlag = false;
	if ((typeOf _x) in Ares_EditableObjectBlacklist || isPlayer _x) then
	{
		_ignoreFlag = true; // Can Manually Set Ignore Flag ?? //////////////////////////////////////////////////////////////////////////////////////
	};
	if !_ignoreFlag then
	{
		["Processing object: %1 - %2", _x, typeof(_x)] call Ares_fnc_LogMessage;
		_ignoreFlag = true;
		_isUnit = (_x isKindOf "CAManBase")
			|| (_x isKindOf "car")
			|| (_x isKindOf "tank")
			|| (_x isKindOf "air")
			|| (_x isKindOf "StaticWeapon")
			|| (_x isKindOf "ship");
		if (_isUnit) then
		{
			if (_x isKindOf "CAManBase") then
			{
				["Is a man."] call Ares_fnc_LogMessage;
				if ((group _x) in _groups) then
				{
					["In an old group."] call Ares_fnc_LogMessage;
				}
				else
				{
					["In a new group."] call Ares_fnc_LogMessage;
					_groups pushBack (group _x);
				};
			}
			else
			{
				if (count crew _x > 0) then
				{
					["Is a vehicle with units."] call Ares_fnc_LogMessage;
					if ((group _x) in _groups) then
					{
						["In an old group."] call Ares_fnc_LogMessage;
					}
					else
					{
						["In a new group."] call Ares_fnc_LogMessage;
						_groups pushBack (group _x);
					};
				}
				else
				{
					["Is an empty vehicle."] call Ares_fnc_LogMessage;
					_emptyVehicles pushBack _x;
				};
			};
		}
		else
		{
			if (_x isKindOf "Logic") then
			{
				["Is a logic. Ignoring."] call Ares_fnc_LogMessage;
			}
			else
			{
				["Is an empty vehicle."] call Ares_fnc_LogMessage;
				_emptyObjects pushBack _x;
			};
		};
	}
	else
	{
		["Ignoring object: %1 - %2", _x, typeof(_x)] call Ares_fnc_LogMessage;
	};
} forEach _objectsToFilter;

_output = [];
if (!_includeUnits) then { _groups = []; };
if (!_includeEmptyVehicles) then { _emptyVehicles = []; };
if (!_includeEmptyObjects) then { _emptyObjects = []; };

_totalUnitsProcessed = 0;
{ /////////////////////////////////////////////////////////////////// Empty objects and vehicles - WORKS
if ((typeof _x) != '') then {
	_output pushBack format [
		"_newObject = createVehicle ['%1', %2, [], 0, 'NONE'];
		 _newObject allowdamage false;
		 _newObject setPosWorld %3;
		 [_newObject, [%4, %5]] remoteExecCall [""setVectorDirAndUp"", 0, _newObject];
		 clearItemCargoGlobal _newObject;
		 clearMagazineCargoGlobal _newObject;
		 clearWeaponCargoGlobal _newObject;
		 _newObject enableDynamicSimulation true;
		 sleep 0.1;
		 _newObject allowDamage true;
		\n",
		(typeOf _x),
		(getPosWorld/*position*/ _x),
		(getPosWorld/*getPosWorld*/ _x),
		(vectorDir _x),
		(vectorUp _x)];
	
	private _name = vehicleVarName _x;
	if (_name != "") then {
		_output pushBack format [
		"
		_newObject setvariable ['lrm_veh_initialized',true,true];
		[_newObject,'%1'] remoteExec ['setvehiclevarname',0,true];
		missionnamespace setvariable ['%1',_newObject,true];
		\n",
		_name];
	};
	
	_mags = getMagazineCargo _x;
	_itemlist = _mags select 0;
	_countlist = _mags select 1;
	_weapons = getWeaponCargo _x;
	_itemlist = _itemlist + (_weapons select 0);
	_countlist = _countlist + (_weapons select 1);
	_items = getItemCargo _x;
	_itemlist = _itemlist + (_items select 0);
	_countlist = _countlist + (_items select 1);
	{
		_item = _x;
		_count = _countlist select _foreachIndex;
		_output pushback format ["_newObject addItemCargoGlobal ['%1',%2];",_item,_count];
	} foreach _itemlist;

	_output pushback "\n";

};
} forEach _emptyObjects + _emptyVehicles;

{ //// Process all the groups ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_sideString = "";
	switch (side _x) do
	{
		case east: { _sideString = "east"; };
		case west: { _sideString = "west"; };
		case resistance: { _sideString = "resistance"; };
		case civilian: { _sideString = "civilian"; };
		default { _sideString = "?"; };
	};
	_output pushBack format [
		"_newGroup = createGroup %1;
		 _newGroup enableDynamicSimulation true;
		\n",
		_sideString];
	_groupVehicles = [];
	// Process all the infantry in the group ////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
	if ((typeof _x) != '') then {
			if (vehicle _x == _x) then
		{
			_output pushBack format [
			"_newUnit = _newGroup createUnit ['%1', %2, [], 0, 'NONE'];
			 _newUnit allowdamage false;
			 _newUnit setSkill %3;
			 _newUnit setRank '%4';
			 _newUnit setFormDir %5;
			 _newUnit setDir %5;
			 _newUnit setPos %6;
			 _newUnit enableDynamicSimulation true;
			 sleep 0.1;
			 _newUnit allowDammage true;
			\n",
			(typeOf _x),
			(position/*getposATL*/ _x),
			(skill _x),
			(rank _x),
			(getDir _x),
			(position/*getPosWorld*/ _x)];
			//Tommo - deeper persistence for some dudes
			if (_x getvariable ["LRM_deep_persist",false]) then {
				private _loadout = getUnitLoadout _x;
				private _name = name _x;
				private _face = face _x;
				_output pushback format [
				"_newUnit setunitloadout [%1,false];
				_newUnit setname '%2';
				_newUnit setface '%3';
				_newUnit setvariable ['LRM_deep_persist',true,true];
				\n",_loadout,_name,_face];
			};
		}
		else
		{
			if (not ((vehicle _x) in _groupVehicles)) then
			{
				_groupVehicles pushBack (vehicle _x);
			};
		};
		_totalUnitsProcessed = _totalUnitsProcessed + 1;
	
		};
	} forEach (units _x);
	// Create the vehicles that are part of the group.///////////////////////////////////////////////////////////////////////////////////////////////
	{
		if ((typeof _x) != '') then {
	
		_output pushBack format [
		"_newUnit = createVehicle ['%1', %2, [], 0, 'NONE'];
		 _newUnit allowdamage false;
		 createVehicleCrew _newUnit;
		 (crew _newUnit) join _newGroup;
		 _newUnit setDir %3;
		 _newUnit setFormDir %3;
		 _newUnit setPosWorld %4;
		 _newUnit enableDynamicSimulation true;
		 sleep 0.1;
		 _newUnit allowdammage true;
		\n",
		(typeOf _x),
		(getposWorld/*position*/ _x),
		(getDir _x),
		(getPosWorld/*getPosWorld*/ _x)];
		
		};
	} forEach _groupVehicles;
	// Set group behaviours /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	_output pushBack format [
	"_newGroup setFormation '%1';
	 _newGroup setCombatMode '%2';
	 _newGroup setBehaviour '%3';
	 _newGroup setSpeedMode '%4';
	\n",
	(formation _x),
	(combatMode _x),
	(behaviour (leader _x)),
	(speedMode _x)];
	// Set Waypoints of Group ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	{
		if (_forEachIndex > 0) then
		{
			_output pushBack format [
			"_newWaypoint = _newGroup addWaypoint [%1, %2];
			 _newWaypoint setWaypointType '%3';%4 %5 %6
			\n",
			(waypointPosition _x),
			0,
			(waypointType _x),
			if ((waypointSpeed _x) != 'UNCHANGED') then { "_newWaypoint setWaypointSpeed '" + (waypointSpeed _x) + "'; " } else { "" },
			if ((waypointFormation _x) != 'NO CHANGE') then { "_newWaypoint setWaypointFormation '" + (waypointFormation _x) + "'; " } else { "" },
			if ((waypointCombatMode _x) != 'NO CHANGE') then { "_newWaypoint setWaypointCombatMode '" + (waypointCombatMode _x) + "'; " } else { "" }];
		};
	} forEach (waypoints _x)
} forEach _groups;

// MARKERS Persistance ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (_includeMarkers) then
{
	{
		_markerName = "Ares_Imported_Marker_" + str(_forEachIndex);
		_output pushBack format [
		"_newMarker = createMarker ['%1', %2];
		 _newMarker setMarkerShape '%3';
		 _newMarker setMarkerType '%4';
		 _newMarker setMarkerDir %5;
		 _newMarker setMarkerColor '%6';
		 _newMarker setMarkerAlpha %7; %8 %9
		\n",
		_markerName,
		(getMarkerPos _x),
		(markerShape _x),
		(markerType _x),
		(markerDir _x),
		(getMarkerColor _x),
		(markerAlpha _x),
		if ((markerShape _x) == "RECTANGLE" ||(markerShape _x) == "ELLIPSE") then { "_newMarker setMarkerSize " + str(markerSize _x) + ";"; } else { ""; },
		if ((markerShape _x) == "RECTANGLE" || (markerShape _x) == "ELLIPSE") then { "_newMarker setMarkerBrush " + str(markerBrush _x) + ";"; } else { ""; }];
	} forEach allMapMarkers;
};
_text = "";
{
	_text = _text + _x;
	[_x] call Ares_fnc_LogMessage;
} forEach _output;
uiNamespace setVariable ['Ares_CopyPaste_Dialog_Text', _text];
_dialog = createDialog "Ares_CopyPaste_Dialog";
[localize "STR_GENERATED_SQF_FROM_MISSION_OBJECTS", count _emptyObjects, count _groups, _totalUnitsProcessed] call Ares_fnc_ShowZeusMessage;
"make_file" callExtension ("LRM_SAVE\LRM_SAVE.sqf" + "|" + _text); // WORKS !!!!!
