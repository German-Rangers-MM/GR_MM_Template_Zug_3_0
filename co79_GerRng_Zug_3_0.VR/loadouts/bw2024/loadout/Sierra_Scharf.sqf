//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Sierra_Scharf
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Sierra_Scharf"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_srifle_G22_wdl","","","CUP_optic_LeupoldMk4_25x50_LRT",["CUP_5Rnd_762x67_G22",5],[],"CUP_bipod_Harris_1A2_L_BLK"],
	[],
	["CUP_hgun_M17_Black","CUP_muzzle_snds_M9","","",["CUP_21Rnd_9x19_M17_Black",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_Kestrel4500",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_PlottingBoard",1],["ACE_RangeCard",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_21Rnd_9x19_M17_Black",3,21],["SmokeShell",2,1],["SmokeShellGreen",1,1],["CUP_5Rnd_762x67_G22",10,5]]],
	["CUP_B_GER_Medic_Flecktarn",[["CUP_NVG_PVS15_black",1],["CUP_H_OpsCore_Covered_Fleck",1],["ACE_EntrenchingTool",1],["ACE_wirecutter",1]]],
	"CUP_H_Ger_Cap_EP_Grn1","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]
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
player setVariable ["ace_safemode_safedweapons", []];
[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;