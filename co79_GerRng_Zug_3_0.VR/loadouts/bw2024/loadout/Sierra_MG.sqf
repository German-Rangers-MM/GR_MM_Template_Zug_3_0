//------------------------------------------------------------------
//------------------------------------------------------------------
//
//  Sierra_MG
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_MG"];

//  https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["CUP_lmg_m249_pip3", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_HensoldtZO_low_RDS", 
        ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch", 200], [], ""
    ],
    [],
    ["CUP_hgun_Glock17_blk", "CUP_muzzle_snds_M9", "", "optic_MRD_black", 
        ["CUP_17Rnd_9x19_glock17", 17], [], ""
    ],
    ["CUP_U_B_GER_Fleck_Crye", [
        ["ACE_CableTie", 4], ["ACE_EarPlugs", 1], ["ACE_IR_Strobe_Item", 1], 
        ["ItemcTabHCam", 1], ["ACE_epinephrine", 2], ["ACE_morphine", 2], 
        ["ACE_MapTools", 1], ["ACE_Flashlight_XL50", 1], ["CUP_H_Ger_Boonie_Flecktarn", 1], 
        ["kat_Caffeine", 1, 15], ["kat_Penthrox", 1, 10]
    ]],
    ["CUP_V_B_GER_Armatus_BB_Fleck", [
        ["CUP_17Rnd_9x19_glock17", 3, 17], ["SmokeShell", 2, 1], ["SmokeShellGreen", 2, 1], 
        ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch", 3, 200]
    ]],
    ["CFP_Camelbak_Mule_RngrGrn", [
        ["CUP_NVG_PVS15_black", 1], ["ACE_salineIV_500", 4], ["ACE_elasticBandage", 15], 
        ["ACE_splint", 2], ["ACE_tourniquet", 2], ["kat_chestSeal", 1], 
        ["ACE_packingBandage", 15], ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch", 2, 200]
    ]],
    "CUP_H_OpsCore_Covered_Fleck",
    "CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
    ["Rangefinder", "", "", "", [], [], ""],
    ["ItemMap", "ItemAndroid", "TFAR_anprc152_15", "ItemCompass", "ACE_Altimeter", ""]
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