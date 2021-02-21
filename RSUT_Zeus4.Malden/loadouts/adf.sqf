_RIFLE = "ADFU_SteyrEF88";
_RIFLE_SILENCER = "";
//_RIFLE_SILENCER = "muzzle_snds_M"; // "";
_RIFLE_MAG = "ADFU_30Rnd_556x45_B";
_RIFLE_MAG_RNDS = 30;
_RIFLE_SCOPE = "ADFU_optic_ElcanS_b"; // "rhsusf_acc_T1_low";
_PISTOL = "ADFU_hpII";
_PISTOL_MAG = "ADFU_13Rnd_45ACP_Mag";
_PISTOL_MAG_RNDS = 13;
_UNIFORM = selectRandom ["ADFU_G3_AMC_Nopad", "ADFU_G3_AMC_Rolled", "ADFU_G3_AMC_Nopad_Rolled", "ADFU_G3_AMC"];
_VEST = "ADFU_V_TBAS_Assaulter_AMC";
_VEST_ASSIST = "ADFU_V_TBAS_Hgunner_Belt_AMC";
_VEST_LEADER = "ADFU_V_TBAS_TeamLeader_Belt_AMC";
_VEST_LIGHT = "ADFU_V_TBAS_Light_AMC";
_HELMET = "ADFU_H_OpsCore_02_AMC";
_HELMET_LEADER = "ADFU_H_OpsCore_03_AMC";
_HELMET_CREW = "ADFU_CavHelmet_AMCS";
_SMOKE_SIGNAL = selectRandom ["SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow"];
_SMOKE = "SmokeShell";
_GRENADE = "HandGrenade";
_NVG = "rhsusf_ANPVS_15";
_BINOS = "ACE_VectorDay";
_HAT = "H_Booniehat_tan"; // "ADFU_Booniehat_AMC";
_AR = "ADFU_minimi";
_AR_MAG = "ADFU_200Rnd_556x45";
_AR_MAG_RNDS = 200;
_AR_SCOPE = "ADFU_optic_ElcanC79";
_MMG = "ADFU_Maximi";
_MMG_MAG = "ADFU_100Rnd_762x51";
_MMG_MAG_RNDS = 100;
_MMG_SCOPE = "ADFU_optic_ElcanC79";
_LAT = "ADFU_launch_M72";
_LAT_MAG = "ACE_PreloadedMissileDummy_ADFU";
_LAT_ITEMS = [];
_MAT = "ADFU_M3_CG";
_MAT_MAG = "ADFU_m3CG_HEAT";
_MAT_SECONDARY = [];
_MAT_SCOPE = "ADFU_optic_M3CG";
_MAT_ITEMS = [];
_MARKSMAN = "";
_MARKSMAN_MAG = "";
_MARKSMAN_SCOPE = "";

_BACKPACK = "ADFU_Assaultpack_AMC";
_BACKPACK_ASSIST = "ADFU_Kitbag_AMC";
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

_RIFLE_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_GRENADE,1,1],[_SMOKE,1,1],[_HAT,1]];
_ASSIST_BACKPACK_ITEMS = [[_RIFLE_MAG,5,_RIFLE_MAG_RNDS],[_SMOKE,1,1]];
_RIFLE_LOADED = [_RIFLE,_RIFLE_SILENCER,"",_RIFLE_SCOPE,[_RIFLE_MAG,_RIFLE_MAG_RNDS],[],""];
_PISTOL_LOADED = [_PISTOL,"","","",[_PISTOL_MAG,_PISTOL_MAG_RNDS],[],""];

#include "_.sqf"
