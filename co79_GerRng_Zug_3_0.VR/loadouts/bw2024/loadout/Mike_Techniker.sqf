//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_Techniker
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_Techniker"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
    ["CUP_arifle_G36KA3_grip_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
    [],
    ["ACE_VMH3","","","",[],[],""],
    ["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",10],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ItemcTabHCam",1],["ACE_EarPlugs",1],["ACE_CableTie",2]]],
    ["GRE_PlateCarrier1_Flecktarn",[["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["CUP_NVG_PVS15_black_WP",1],["CUP_30Rnd_556x45_G36_wdl",6,30],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_HandGrenade_M67",4,1],["SmokeShell",4,1],["MiniGrenade",4,1]]],
    ["CFP_Camelbak_Mule_RngrGrn",[["ACE_DefusalKit",1],["ace_marker_flags_red",5],["ace_marker_flags_white",5],["ToolKit",1]]],
    "CUP_H_OpsCore_Covered_Fleck","",["Rangefinder","","","",[],[],""],
    ["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",0,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",2,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
