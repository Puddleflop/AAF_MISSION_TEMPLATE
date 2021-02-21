_RIFLE = "rhs_weap_m16a4_carryhandle";
_RIFLE_SILENCER = "";
//_RIFLE_SILENCER = "muzzle_snds_M"; // "";
_RIFLE_MAG = "rhs_mag_30Rnd_556x45_M855_Stanag";
_RIFLE_MAG_RNDS = 30;
_RIFLE_SCOPE = "";
_PISTOL = "rhsusf_weap_m1911a1";
_PISTOL_MAG = "rhsusf_mag_7x45acp_MHP";
_PISTOL_MAG_RNDS = 13;
_UNIFORM = selectRandom ["rhsgref_uniform_3color_desert"];
_VEST = "LOP_V_CarrierLite_WDL";
_VEST_ASSIST = _VEST;
_VEST_LEADER = _VEST;
_VEST_LIGHT = _VEST;
_HELMET = "rhsgref_helmet_pasgt_3color_desert_rhino";
_HELMET_LEADER = _HELMET;
_HELMET_CREW = _HELMET;
_SMOKE_SIGNAL = selectRandom ["SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow"];
_SMOKE = "SmokeShell";
_GRENADE = "HandGrenade";
_NVG = "rhsusf_ANPVS_15";
_BINOS = "rhssaf_zrak_rd7j";
_HAT = "";
_AR = "rhs_weap_m249_pip";
_AR_MAG = "rhsusf_200Rnd_556x45_M855_soft_pouch";
_AR_MAG_RNDS = 200;
_AR_SCOPE = "";
_MMG = "rhs_weap_m240G";
_MMG_MAG = "rhsusf_100Rnd_762x51";
_MMG_MAG_RNDS = 100;
_MMG_SCOPE = "";
_LAT = "rhs_weap_M136_hedp";
_LAT_MAG = "";
_LAT_ITEMS = [];
_MAT = "rhs_weap_smaw_green";
_MAT_MAG = "rhs_mag_smaw_HEDP";
_MAT_SECONDARY = ["rhs_mag_smaw_SR",5];
_MAT_SCOPE = "rhs_weap_optic_smaw";
_MAT_ITEMS = [];
_MARKSMAN = "";
_MARKSMAN_MAG = "";
_MARKSMAN_SCOPE = "";

_BACKPACK = "rhsgref_wdl_alicepack";
_BACKPACK_ASSIST = "rhsgref_wdl_alicepack";
_BACKPACK_MEDIC = "B_Kitbag_rgr";
_BACKPACK_CLS = "B_AssaultPack_rgr_Medic";

_RADIO = "ACRE_PRC343";
_LR_RADIO = "ACRE_PRC152";
// _LR_RADIO = "ACRE_PRC117F"; // for dense/large distances

// standards
_BASE_ITEMS = ["ItemMap","","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]; // do not edit

_UNIFORM_ITEMS = [[_SMOKE,1,1],["ACE_fieldDressing",3],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_quikclot",5],["ACE_morphine",1],["ACE_epinephrine", 1],["ACE_tourniquet",4]];
_CLS_BACKPACK_ITEMS = [["ACE_fieldDressing",13],["ACE_packingBandage",18],["ACE_elasticBandage",18],["ACE_quikclot",18],["ACE_morphine",9],["ACE_epinephrine",9],["ACE_tourniquet",5]];
_MEDIC_BACKPACK_ITEMS = [["ACE_fieldDressing",16],["ACE_packingBandage",31],["ACE_elasticBandage",31],["ACE_quikclot",31],["ACE_morphine",17],["ACE_epinephrine",17],["ACE_tourniquet",9],["ACE_bloodIV",8],["adv_aceCPR_AED",1]];

_VEST_ITEMS = [[_NVG,1],[_RADIO,1],[_SMOKE,1,1]];
_RIFLE_VEST_ITEMS = _VEST_ITEMS + [[_RIFLE_MAG,7,_RIFLE_MAG_RNDS],[_GRENADE,1,1],[_SMOKE,1,1]];
_ASSIST_VEST_ITEMS = _VEST_ITEMS + [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_GRENADE,1,1]];

_RIFLE_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_GRENADE,1,1],[_SMOKE,1,1],[_HAT,1]]; /* ,["ACE_EntrenchingTool", 1]]; */
_ASSIST_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_SMOKE,1,1]];
_RIFLE_LOADED = [_RIFLE,_RIFLE_SILENCER,"",_RIFLE_SCOPE,[_RIFLE_MAG,_RIFLE_MAG_RNDS],[],""];
_PISTOL_LOADED = [_PISTOL,"","","",[_PISTOL_MAG,_PISTOL_MAG_RNDS],[],""];

#include "_.sqf"
