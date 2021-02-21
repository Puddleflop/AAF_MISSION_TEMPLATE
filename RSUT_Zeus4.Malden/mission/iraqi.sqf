private _uniforms = ["LOP_U_US_Fatigue_03", "LOP_U_TKA_Fatigue_02", "rhsgref_uniform_dpm", "LOP_U_IRA_Fatigue_GRK_OLV"];
private _helmets = ["rhsgref_helmet_M1_bare", "rhsgref_helmet_M1_bare_alt01", "rhssaf_beret_black"];
private _vests = ["V_TacChestrig_grn_F", "V_TacChestrig_oli_F"];
private _weapons = ["rhs_weap_akmn", "rhs_weap_akm", "rhs_weap_akmn", "rhs_weap_akm", "rhs_weap_pm63"];

{
  _x setUnitLoadout [
     [selectRandom _weapons, "", "", "", ["rhs_30Rnd_762x39mm", 30], [], ""],
     [],
     [],
     [
        selectRandom _uniforms,
        [
           ["rhs_mag_rgd5", 1, 1],
           ["rhs_30Rnd_762x39mm", 1, 30]
        ]
     ],
     [
        selectRandom _vests,
        [
           ["rhs_30Rnd_762x39mm", 5, 30]
        ]
     ],
     [],
     selectRandom _helmets,
     "",
     [],
     [
        "",
        "",
        "ItemRadio",
        "",
        "",
        ""
     ]
  ]
} foreach (units _this);
