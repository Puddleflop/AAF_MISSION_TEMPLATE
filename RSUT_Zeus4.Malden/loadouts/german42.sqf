_RIFLE = "rhs_weap_kar98k";
_RIFLE_SILENCER = "";
//_RIFLE_SILENCER = "muzzle_snds_M"; // "";
_RIFLE_MAG = "rhsgref_5Rnd_792x57_kar98k";
_RIFLE_SCOPE = "";
_RIFLE_MAG_RNDS = 5;
_PISTOL = "";
_PISTOL_MAG = "";
_PISTOL_MAG_RNDS = 0;
_UNIFORM = selectRandom ["LOP_U_US_Fatigue_03"];
_VEST = "V_TacChestrig_grn_F";
_VEST_ASSIST = _VEST;
_VEST_LEADER = _VEST;
_VEST_LIGHT = _VEST;
_HELMET = "rhsgref_hat_M1951";
_HELMET_LEADER = _HELMET;
_HELMET_CREW = _HELMET;
_SMOKE_SIGNAL = selectRandom ["SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow"];
_SMOKE = "SmokeShell";
_GRENADE = "rhs_mag_f1";
_NVG = "";
_BINOS = "rhssaf_zrak_rd7j";
_HAT = "";
_AR = "rhs_weap_MP44";
_AR_MAG = "rhsgref_30Rnd_792x33_SmE_StG";
_AR_MAG_RNDS = 30;
_AR_SCOPE = "";
_MMG = "rhs_weap_mg42";
_MMG_MAG = "rhsgref_296Rnd_792x57_SmK_belt";
_MMG_MAG_RNDS = 296;
_MMG_SCOPE = "";
_LAT = "rhs_weap_panzerfaust60";
_LAT_MAG = "";
_LAT_ITEMS = ["rhsgref_mag_rkg3em", 1];
_MAT = "rhs_weap_panzerfaust60";
_MAT_MAG = "";
_MAT_SECONDARY = [];
_MAT_SCOPE = "";
_MAT_ITEMS = [];
_MARKSMAN = "";
_MARKSMAN_MAG = "";
_MARKSMAN_SCOPE = "";

_BACKPACK = "rhsgref_ttsko_alicepack";
_BACKPACK_ASSIST = "rhssaf_alice_smb";
_BACKPACK_MEDIC = "rhs_medic_bag";
_BACKPACK_CLS = "B_LegStrapBag_olive_F";

_RADIO = "";
_LR_RADIO = "ACRE_PRC152";
// _LR_RADIO = "ACRE_PRC117F"; // for dense/large distances

// standards
_BASE_ITEMS = ["ItemMap","","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]; // do not edit

_UNIFORM_ITEMS = [[_SMOKE,1,1],["ACE_fieldDressing",3],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_morphine",1],["ACE_epinephrine", 1],["ACE_tourniquet",4]];
_CLS_BACKPACK_ITEMS = [["ACE_fieldDressing",13],["ACE_packingBandage",18],["ACE_elasticBandage",18],["ACE_quikclot",18],["ACE_morphine",9],["ACE_epinephrine",9],["ACE_tourniquet",5]];
_MEDIC_BACKPACK_ITEMS = [["ACE_fieldDressing",16],["ACE_packingBandage",31],["ACE_elasticBandage",31],["ACE_quikclot",31],["ACE_morphine",17],["ACE_epinephrine",17],["ACE_tourniquet",9],["ACE_bloodIV",8]];

_VEST_ITEMS = [[_NVG,1],[_RADIO,1],[_SMOKE,1,1]];
_RIFLE_VEST_ITEMS = _VEST_ITEMS + [[_RIFLE_MAG,7,_RIFLE_MAG_RNDS],[_GRENADE,1,1],[_SMOKE,1,1]];
_ASSIST_VEST_ITEMS = _VEST_ITEMS + [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_GRENADE,1,1]];

_RIFLE_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_GRENADE,1,1],[_SMOKE,1,1],[_HAT,1]]; /* ,["ACE_EntrenchingTool", 1]]; */
_ASSIST_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_SMOKE,1,1]];
_RIFLE_LOADED = [_RIFLE,_RIFLE_SILENCER,"",_RIFLE_SCOPE,[_RIFLE_MAG,_RIFLE_MAG_RNDS],[],""];
_PISTOL_LOADED = [_PISTOL,"","","",[_PISTOL_MAG,_PISTOL_MAG_RNDS],[],""];

#include "_.sqf"
