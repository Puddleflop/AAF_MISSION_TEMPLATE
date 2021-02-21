// probably dont edit below this
_this params ["_unit", "_loadout", "_lrm"];

_ON_LRM = {
	[[], _this] select _lrm;
};

// kits, using setUnitLoadout format
switch (_loadout) do {
	case "secco": {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			_PISTOL_LOADED,
			[_UNIFORM, _UNIFORM_ITEMS + [[_PISTOL_MAG,1,_PISTOL_MAG_RNDS]]],
			[_VEST_LEADER, _RIFLE_VEST_ITEMS + [[_LR_RADIO,1]]],
			[_BACKPACK, _RIFLE_BACKPACK_ITEMS + [_SMOKE_SIGNAL,2,1]] call _ON_LRM,
			_HELMET_LEADER,
			"",
			[_BINOS,"","","",[],[],""],
			_BASE_ITEMS
		];
	};
	case "cls": {
		_unit setUnitTrait ["medic", true];
		_unit setVariable ["ace_medical_medicClass", 2, true];
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _RIFLE_VEST_ITEMS],
			[_BACKPACK_CLS, _CLS_BACKPACK_ITEMS],
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	default {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _RIFLE_VEST_ITEMS],
			[_BACKPACK, _RIFLE_BACKPACK_ITEMS] call _ON_LRM,
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "ar": {
		_unit setUnitLoadout [
			[_AR,"","",_AR_SCOPE,[_AR_MAG,_AR_MAG_RNDS],[],""],
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _VEST_ITEMS + [[_AR_MAG,1,_AR_MAG_RNDS],[_GRENADE,1,1]]],
			[_BACKPACK, [[_AR_MAG,2,_AR_MAG_RNDS]]] call _ON_LRM,
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "lat": {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[_LAT,"","","",[_LAT_MAG,1],[],""],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _RIFLE_VEST_ITEMS + _LAT_ITEMS],
			[_BACKPACK, _ASSIST_BACKPACK_ITEMS] call _ON_LRM,
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};

	// assist
	case "medic": {
		_unit setUnitTrait ["medic", true];
		_unit setVariable ["ace_medical_medicClass", 2, true];
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _ASSIST_VEST_ITEMS],
			[_BACKPACK_MEDIC, _MEDIC_BACKPACK_ITEMS],
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "mat": {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[_MAT,"","",_MAT_SCOPE,[_MAT_MAG,1],_MAT_SECONDARY,""],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _ASSIST_VEST_ITEMS + _MAT_ITEMS],
			[_BACKPACK, _ASSIST_BACKPACK_ITEMS + [[_MAT_MAG,1,1]]] call _ON_LRM,
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "mat_assist": {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _ASSIST_VEST_ITEMS],
			[_BACKPACK_ASSIST, _ASSIST_BACKPACK_ITEMS + [[_MAT_MAG,3,1]]],
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "mmg": {
		_unit setUnitLoadout [
			[_MMG,"","",_MMG_SCOPE,[_MMG_MAG,_MMG_MAG_RNDS],[],""],
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _VEST_ITEMS + [[_MMG_MAG,4,_MMG_MAG_RNDS]]],
			[],
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
	case "mmg_assist": {
		_unit setUnitLoadout [
			_RIFLE_LOADED,
			[],
			[],
			[_UNIFORM, _UNIFORM_ITEMS],
			[_VEST, _ASSIST_VEST_ITEMS],
			[_BACKPACK_ASSIST, _ASSIST_BACKPACK_ITEMS + [[_MMG_MAG,4,_MMG_MAG_RNDS]]],
			_HELMET,
			"",
			[],
			_BASE_ITEMS
		];
	};
};
