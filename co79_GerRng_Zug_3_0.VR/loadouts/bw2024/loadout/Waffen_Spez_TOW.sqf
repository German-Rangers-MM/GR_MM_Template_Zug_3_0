//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Waffen_Spez_TOW
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Waffen_Spez_TOW"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36K_RIS","","CUP_acc_LLM_black","CUP_optic_Elcan_SpecterDR_KF_RMR_black",["CUP_30Rnd_556x45_G36",30],[],"CUP_Bipod_G36"],
	["CUP_TOW2_carry","","","",[],[],""],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["CUP_17Rnd_9x19_M17_Black",1,17],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",6,30]]],
	[],
	"CUP_H_OpsCore_Covered_Fleck_SF","",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch",""]
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