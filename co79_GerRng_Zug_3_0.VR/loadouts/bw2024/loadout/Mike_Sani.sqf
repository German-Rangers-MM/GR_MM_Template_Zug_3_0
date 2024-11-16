//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_Sani
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_Sani"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3_grip_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["CUP_17Rnd_9x19_M17_Black",1,17],["SmokeShell",2,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",4,30]]],
	["B_Kitbag_rgr",[["ACE_adenosine",7],["ACE_elasticBandage",30],["ACE_packingBandage",10],["ACE_epinephrine",10],["ACE_morphine",1],["ACE_salineIV_500",22],["ACE_splint",5],["ACE_surgicalKit",1],["ACE_tourniquet",4],["kat_IV_16",25],["kat_chestSeal",10],["kat_EACA",5],["kat_IO_FAST",5],["kat_fentanyl",5],["kat_ketamine",2],["kat_larynx",15],["kat_naloxone",1],["kat_nitroglycerin",6],["kat_Pulseoximeter",3],["kat_TXA",10],["kat_BVM",1],["kat_stethoscope",1],["kat_ncdKit",5]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",[],
	["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch",""]
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