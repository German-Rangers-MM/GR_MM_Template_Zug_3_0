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
	[],
	["CUP_U_B_GER_Fleck_Crye",[["CUP_NVG_PVS15_black",1],["ACE_IR_Strobe_Item",1],["ACE_EarPlugs",1],["ACE_CableTie",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["ACE_surgicalKit",1],["ACE_tourniquet",4],["kat_Pulseoximeter",5],["SmokeShell",2,1],["kat_Caffeine",1,15],["CUP_30Rnd_556x45_G36_wdl",4,30]]],
	["CUP_B_GER_Pack_Flecktarn",[["ACE_elasticBandage",25],["ACE_salineIV_500",30],["ACE_epinephrine",10],["ACE_adenosine",7],["kat_BVM",1],["kat_IV_16",25],["kat_ketamine",2],["kat_EACA",10],["kat_TXA",20],["kat_fentanyl",5],["ACE_morphine",1],["kat_nitroglycerin",10],["kat_chestSeal",10],["kat_larynx",15],["ACE_splint",10],["kat_IO_FAST",5],["kat_Carbonate",1,10],["kat_oxygenTank_150",1,100]]],
	"CUP_H_OpsCore_Covered_Fleck","CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",[],
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
player setVariable ["ace_safemode_safedweapons", []];
[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;