//------------------------------------------------------------------
//------------------------------------------------------------------
//
//  Sierra_San
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_San"];

//  https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["SPS_hk416_11_sl_t_ctr_a7_black_f", "muzzle_snds_HXQD556K_black_M", "sps_M300C_RAID_IR", "SPS_EOTech_Black_3xMAG_up", 
        ["SPS_HKG3PMAG_30Rnd_556x45_B_Mk318", 30], [], ""
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1], 
        ["CUP_H_Ger_Boonie_Flecktarn", 1], ["kat_Caffeine", 1, 15], ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["CUP_muzzle_mfsup_Flashhider_556x45_Black", 1], ["CUP_17Rnd_9x19_glock17", 3, 17], 
        ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], ["tsp_flashbang_m84", 4, 1], 
        ["SPS_HKG3PMAG_30Rnd_556x45_B_Mk318", 7, 30], ["ACE_NVG_Gen4_Black_WP", 1]
    ]],
    ["CFP_Kitbag_Flecktarn", [
        ["kat_IV_16", 10], ["ACE_adenosine", 10], ["kat_chestSeal", 10], ["ACE_elasticBandage", 50], 
        ["kat_EACA", 10], ["ACE_epinephrine", 10], ["kat_IO_FAST", 15], ["kat_fentanyl", 6], 
        ["kat_ketamine", 6], ["kat_larynx", 5], ["ACE_morphine", 10], ["kat_TXA", 15], 
        ["ACE_tourniquet", 4], ["ACE_splint", 4], ["ACE_salineIV_500", 18], 
        ["kat_Pulseoximeter", 6], ["kat_pocketBVM", 1], ["kat_nitroglycerin", 10], 
        ["kat_naloxone", 2], ["ACE_surgicalKit", 1], ["ACE_packingBandage", 30], 
        ["kat_stethoscope", 1], ["kat_ncdKit", 10]
    ]],
    "CUP_H_OpsCore_Covered_Fleck",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Rangefinder", "", "", "", [], [], ""],
    ["ItemMap", "ItemAndroid", "TFAR_anprc152_12", "ItemCompass", "ACE_Altimeter", ""]
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