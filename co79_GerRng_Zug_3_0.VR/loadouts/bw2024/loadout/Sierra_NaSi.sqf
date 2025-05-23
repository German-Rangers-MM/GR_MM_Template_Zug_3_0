//------------------------------------------------------------------
//------------------------------------------------------------------
//
//  Sierra_NaSi
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_NaSi"];

//  https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["SPS_hk417_13_glm_black_f", "muzzle_snds_HX762_black_H", "sps_M300C_RAID_IR", "CUP_optic_Elcan_SpecterDR_KF_RMR_black", 
        ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 20], ["ACE_HuntIR_M203", 1], ""
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1],
        ["CUP_H_OpsCore_Covered_Fleck", 1], ["kat_Caffeine", 1, 15], ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["CUP_17Rnd_9x19_glock17", 3, 17], ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], ["CUP_muzzle_mfsup_Flashhider_762x51_Black", 1],
        ["tsp_flashbang_m84", 4, 1], ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 7, 20], ["ACE_HuntIR_M203", 6, 1]
    ]],
    ["CFP_Kitbag_Flecktarn", [
        ["kat_IV_16", 5], ["ACE_adenosine", 5], ["kat_chestSeal", 10], ["ACE_elasticBandage", 40], 
        ["kat_EACA", 5], ["ACE_epinephrine", 5], ["kat_IO_FAST", 5], ["kat_fentanyl", 3], 
        ["kat_ketamine", 3], ["kat_larynx", 5], ["ACE_morphine", 5], ["kat_TXA", 10], 
        ["ACE_tourniquet", 4], ["ACE_splint", 2], ["ACE_salineIV_500", 12], 
        ["kat_Pulseoximeter", 3], ["kat_pocketBVM", 1], ["kat_nitroglycerin", 5], 
        ["kat_naloxone", 1], ["ACE_surgicalKit", 1], ["ACE_packingBandage", 20], 
        ["kat_stethoscope", 1], ["kat_ncdKit", 10], ["ACE_NVG_Gen4_Black_WP", 1]
    ]],
    "CUP_H_Ger_Boonie_Flecktarn",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Rangefinder", "", "", "", [], [], ""],
    ["ItemMap", "ItemAndroid", "TFAR_anprc152", "ItemCompass", "ACE_Altimeter", ""]
];

//------------------------------------------------------------------
//  ACE Optionen fuer Spieler
//------------------------------------------------------------------
//  Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//  Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//  Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//  Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;