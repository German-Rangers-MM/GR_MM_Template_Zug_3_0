//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Sierra_GrpFhr
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_GrpFhr"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["CUP_arifle_HK417_12_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_OD_L", "CUP_optic_Elcan_SpecterDR_KF_RMR_od", 
        ["CUP_20Rnd_762x51_HK417", 20], [], "CUP_bipod_Harris_1A2_L"
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1], ["ItemAndroid", 1], 
        ["kat_Caffeine", 1, 15], ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["CUP_17Rnd_9x19_glock17", 3, 17], ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], 
        ["ACE_M84", 4, 1], ["CUP_20Rnd_762x51_HK417_Camo_Wood", 7, 20]
    ]],
    ["tfw_ilbeMR3000_whip_sierraflk", [
        ["CUP_H_OpsCore_Covered_Fleck", 1], ["CUP_NVG_PVS15_black", 1], ["ACE_salineIV_500", 4], 
        ["ACE_elasticBandage", 15], ["ACE_splint", 2], ["ACE_tourniquet", 2], 
        ["kat_chestSeal", 1], ["ACE_packingBandage", 15], ["CUP_muzzle_mfsup_Flashhider_762x51_OD", 1], 
        ["ACE_HuntIR_monitor", 1], ["ACE_surgicalKit", 1], ["B_IR_Grenade", 4, 1], 
        ["SmokeShellRed", 4, 1], ["SmokeShellPurple", 4, 1]
    ]],
    "CUP_H_Ger_Boonie_Flecktarn",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Laserdesignator_02_ghex_F", "", "", "", ["Laserbatteries", 1], [], ""],
    ["ItemMap", "ItemcTab", "TFAR_anprc152", "ItemCompass", "ACE_Altimeter", ""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;