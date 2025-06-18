//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Lima
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Lima"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36K","","CUP_acc_LLM_black","CUP_optic_G36DualOptics",["CUP_30Rnd_556x45_G36",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Flecktarn_2",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_PlottingBoard",1],["ACE_artilleryTable",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1],["ACE_Fortify",1],["ACE_DefusalKit",1],["CUP_17Rnd_9x19_M17_Black",2,17],["HandGrenade",3,1],["SmokeShell",3,1],["CUP_30Rnd_556x45_G36",4,30],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",2,30]]],
	["tfw_ilbeRT1523_whip_flk",[["ToolKit",1],["B_UavTerminal",1]]],
	"CUP_H_Ger_M92_Cover","CUP_G_Oakleys_Clr",[],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch",""]
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