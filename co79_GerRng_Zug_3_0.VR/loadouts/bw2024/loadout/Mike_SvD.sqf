//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Mike_SvD
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Mike_SvD"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36K_RIS_AG36_wdl","","CUP_acc_LLM_od","CUP_optic_G33_HWS_OD",["CUP_30Rnd_556x45_G36_wdl",30],["1Rnd_Smoke_Grenade_shell",1],""],
	[],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_EntrenchingTool",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["1Rnd_Smoke_Grenade_shell",5,1],["ACE_40mm_Flare_ir",1,1],["SmokeShellGreen",1,1],["SmokeShellRed",1,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",3,30]]],
	["TFAR_rt1523g_big_bwmod",[["ACE_elasticBandage",20],["ACE_salineIV_500",10],["kat_TXA",10],["kat_EACA",10],["kat_nitroglycerin",10],["ACE_tourniquet",4],["ACE_surgicalKit",1],["ACE_splint",5],["kat_BVM",1],["kat_larynx",10],["kat_Pulseoximeter",3],["kat_chestSeal",5],["kat_IV_16",10],["ACE_epinephrine",3],["kat_IO_FAST",3],["ACE_adenosine",3],["kat_lorazepam",2],["kat_stethoscope",1],["kat_ncdKit",5],["kat_Penthrox",1,10],["kat_Caffeine",1,15],["kat_naloxone",1],["kat_ketamine",3]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tan_Glasses_Dark",["Rangefinder","","","",[],[],""],
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