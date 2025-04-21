//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_AvD
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_AvD"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3_grip_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
	[],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ace_marker_flags_red",1],["ace_marker_flags_green",1],["ace_marker_flags_yellow",1],["ace_marker_flags_black",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["ACE_personalAidKit",1],["ACE_surgicalKit",1],["kat_Pulseoximeter",5],["kat_AED",1],["SmokeShell",2,1],["ACE_Chemlight_HiRed",1,1],["ACE_Chemlight_HiGreen",1,1],["ACE_Chemlight_HiYellow",1,1],["CUP_30Rnd_556x45_G36_wdl",1,30]]],
	["tfw_ilbeRT1523_whip_flk",[["ACE_elasticBandage",15],["ACE_salineIV_500",10],["ACE_splint",5],["ACE_morphine",2],["ACE_epinephrine",6],["ACE_adenosine",5],["kat_BVM",1],["kat_IV_16",15],["kat_chestSeal",5],["kat_IO_FAST",2],["kat_larynx",10],["kat_naloxone",1],["kat_ketamine",1],["kat_phenylephrine",1],["kat_lorazepam",1],["kat_EACA",10],["kat_TXA",10],["kat_fentanyl",3],["kat_nitroglycerin",10],["kat_ncdKit",3],["kat_stethoscope",1],["kat_oxygenTank_150",1,100],["kat_Carbonate",1,10],["kat_Caffeine",1,15]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",["Laserdesignator_02_ghex_F","","","",["Laserbatteries",1],[],""],
	["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ItemWatch",""]
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