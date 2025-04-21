//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	ZugSani
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","ZugSani"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3_grip_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36",30],[],"CUP_Bipod_G36_wood"],
	[],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["kat_Pulseoximeter",3],["ACE_tourniquet",4]]],
	["GRE_PlateCarrier1_Flecktarn",[["ACE_surgicalKit",1],["kat_BVM",1],["kat_TXA",20],["ACE_RangeTable_82mm",1],["ACE_artilleryTable",1],["ACE_PlottingBoard",1],["SmokeShellRed",2,1],["SmokeShell",2,1],["ACE_Chemlight_HiRed",4,1],["ACE_Chemlight_HiGreen",4,1],["ACE_HandFlare_Green",2,1],["ACE_HandFlare_Red",2,1],["SmokeShellPurple",2,1],["CUP_30Rnd_556x45_G36",2,30],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36",1,30]]],
	["tfw_ilbeRT1523_DD_flk",[["kat_IV_16",15],["ACE_adenosine",5],["ACE_elasticBandage",15],["kat_chestSeal",7],["kat_EACA",10],["kat_IO_FAST",5],["kat_larynx",10],["kat_ketamine",3],["kat_fentanyl",3],["ACE_epinephrine",10],["ACE_morphine",1],["kat_naloxone",1],["kat_nitroglycerin",12],["ACE_salineIV_500",15],["ACE_splint",5],["kat_Carbonate",1,10],["kat_Penthrox",1,10],["kat_Caffeine",1,15]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",["Laserdesignator","","","",["Laserbatteries",1],[],""],
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