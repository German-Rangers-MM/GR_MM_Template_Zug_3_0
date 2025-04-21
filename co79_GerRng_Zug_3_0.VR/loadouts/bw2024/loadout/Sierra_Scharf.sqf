//------------------------------------------------------------------
//------------------------------------------------------------------
//
//  Sierra_Scharf
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_Scharf"];

//  https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["SPS_AI_AXMC338_27_B_PRCFB_F", "muzzle_snds_SPS_AI_B_H", "", "SPS_Optic_SnB_HP_5_45_Black", 
        ["SPS_AI_AXMC_338_300gr_Berger_Mag", 10], [], ""
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1], ["ACE_RangeCard", 1], 
        ["kat_Caffeine", 1, 15], ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["CUP_17Rnd_9x19_glock17", 3, 17], ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], 
        ["tsp_flashbang_m84", 4, 1], ["SPS_AI_AXMC_338_300gr_Berger_Mag", 10, 10]
    ]],
    ["CFP_Kitbag_Flecktarn", [
        ["kat_chestSeal", 5], ["ACE_elasticBandage", 20], ["ACE_epinephrine", 5], 
        ["ACE_morphine", 5], ["ACE_tourniquet", 4], ["ACE_splint", 2], ["ACE_salineIV_500", 6], 
        ["ACE_packingBandage", 10], ["ACE_NVG_Gen4_Black_WP", 1], ["CUP_H_OpsCore_Covered_Fleck", 1]
    ]],
    "CUP_H_Ger_Cap_EP_Grn1",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Rangefinder", "", "", "", [], [], ""],
    ["ItemMap", "ItemAndroid", "TFAR_anprc152_25", "ItemCompass", "ACE_Altimeter", ""]
];

//------------------------------------------------------------------
//  ACE Optionen fuer Spieler
//------------------------------------------------------------------
//  Medic:
player setVariable ["ACE_medical_medicClass",0,true];

//  Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//  Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//  Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;