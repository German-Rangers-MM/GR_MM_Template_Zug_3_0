//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_Tech
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_SaniL_Tech"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3","","CUP_acc_LLM_black","CUP_optic_Elcan_SpecterDR_KF_RMR_black",["CUP_30Rnd_556x45_G36",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_CableTie",1],["ACE_IR_Strobe_Item",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_EarPlugs",1]]],
	["gerrng_PlateCarrier1_Flecktarn",[["SmokeShell",2,1],["CUP_21Rnd_9x19_M17_Black",1,21],["CUP_HandGrenade_M67",2,1],["CUP_30Rnd_556x45_G36",6,30]]],
	["B_Kitbag_rgr",[["ToolKit",1],["SmokeShell",5,1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_DefusalKit",1]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Black_Glasses_Dark",[],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",2,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;
