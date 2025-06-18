//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Sierra_AufSan
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_AufSan"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["CUP_smg_MP7", "CUP_muzzle_snds_MP7", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", 
        ["CUP_40Rnd_46x30_MP7", 40], [], ""
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1], ["kat_Caffeine", 1, 15], 
        ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["ACE_NVG_Gen4_Black_WP", 1], ["CUP_H_OpsCore_Covered_Fleck", 1], 
        ["CUP_17Rnd_9x19_glock17", 3, 17], ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], 
        ["tsp_flashbang_m84", 4, 1], ["CUP_40Rnd_46x30_MP7", 7, 40]
    ]],
    ["tfw_ilbeMR3000_whip_sierraflk", [
        ["kat_IV_16", 10], ["ACE_adenosine", 5], ["ACE_elasticBandage", 20], 
        ["kat_chestSeal", 10], ["kat_EACA", 20], ["ACE_epinephrine", 15], 
        ["kat_ketamine", 10], ["kat_TXA", 25], 
        ["ACE_tourniquet", 4], ["ACE_splint", 8], ["kat_Pulseoximeter", 10], 
        ["kat_pocketBVM", 1], ["kat_nitroglycerin", 10], ["kat_naloxone", 2], 
        ["kat_larynx", 10], ["ACE_salineIV_500", 14], ["ACE_surgicalKit", 1], 
        ["kat_stethoscope", 1], ["kat_ncdKit", 10], ["ACE_packingBandage", 5], 
        ["kat_IO_FAST", 15], ["ACE_morphine", 5]
    ]],
    "CUP_H_Ger_Boonie_Flecktarn",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Laserdesignator_02_ghex_F", "", "", "", ["Laserbatteries", 1], [], ""],
    ["ItemMap", "ItemAndroid", "TFAR_anprc152_4", "ItemCompass", "ACE_Altimeter", ""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;