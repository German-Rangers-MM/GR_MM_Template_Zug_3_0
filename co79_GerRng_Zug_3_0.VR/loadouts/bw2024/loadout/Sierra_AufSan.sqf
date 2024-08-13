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
	["CUP_arifle_HK417_20","","CUP_acc_LLM_black","CUP_optic_Elcan_SpecterDR_KF_black",["CUP_20Rnd_762x51_HK417",20],[],"CUP_bipod_Harris_1A2_L_BLK"],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_21Rnd_9x19_M17_Black",21],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",1],["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["ACE_surgicalKit",1],["CUP_H_OpsCore_Covered_Fleck",1],["CUP_NVG_PVS15_black",1],["CUP_21Rnd_9x19_M17_Black",1,21],["SmokeShell",2,1],["SmokeShellGreen",2,1],["CUP_20Rnd_762x51_HK417",4,20]]],
	["CUP_B_GER_Medic_Flecktarn",[["ACE_elasticBandage",50],["ACE_quikclot",20],["ACE_splint",4],["ACE_salineIV_500",15],["ACE_epinephrine",10],["ACE_adenosine",5],["ACE_morphine",5],["ACE_tourniquet",4],["kat_IO_FAST",10],["kat_IV_16",10],["kat_chestSeal",10],["kat_larynx",10],["kat_EACA",10],["kat_TXA",15],["kat_fentanyl",5],["kat_ketamine",5],["kat_nitroglycerin",10],["kat_Pulseoximeter",2],["kat_pocketBVM",1],["kat_naloxone",1]]],
	"CUP_H_Ger_Cap_EP_Grn1","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ACE_Altimeter",""]
];

//------------------------------------------------------------------
//ACE Optionen fuer Spieler
//------------------------------------------------------------------
//Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//Combat Engineer:
player setVariable ["ACE_isEngineer",0,true];

//Explosive Specialist:
player setVariable ["ACE_isEOD",false,true];

//Waffe sichern
[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;