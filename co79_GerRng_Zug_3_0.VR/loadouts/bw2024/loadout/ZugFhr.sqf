//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	ZugFhr
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","ZugFhr"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_21Rnd_9x19_M17_Black",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["CUP_21Rnd_9x19_M17_Black",2,21],["SmokeShellGreen",2,1],["SmokeShellPurple",2,1],["SmokeShellRed",2,1],["SmokeShell",4,1],["ACE_Chemlight_HiGreen",2,1],["ACE_Chemlight_HiRed",2,1],["ACE_HandFlare_Red",1,1],["ACE_HandFlare_Green",1,1],["B_IR_Grenade",2,1],["Laserbatteries",1,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",4,30]]],
	["TFAR_rt1523g_bwmod",[]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",0,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;