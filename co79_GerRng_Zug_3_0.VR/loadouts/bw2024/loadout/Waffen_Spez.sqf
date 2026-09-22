//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Waffen_Spez
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Waffen_Spez"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["SPS_hk416_16_5_g95_hk_sf_black_f","","","CUP_optic_Elcan_SpecterDR_RMR_black",["SPS_HKG3PMAG_30Rnd_556x45_B_Mk318",30],[],"CUP_bipod_Harris_1A2_L_BLK"],
	[],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_elasticBandage",5],["ACE_packingBandage",10],["kat_chestSeal",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ACE_MapTools",1],["ACE_IR_Strobe_Item",1]]],
	["gerrng_PlateCarrier1_Flecktarn",[["GerRng_rations_HydrationBladder_3L",1],["GerRng_rations_EPa_typ_xvii",1],["ACE_EntrenchingTool",1],["SmokeShell",4,1],["SPS_HKG3PMAG_30Rnd_556x45_B_M995",3,30],["SPS_HKG3PMAG_30Rnd_556x45_B_Mk318",4,30],["SPS_HKG3PMAG_30Rnd_556x45_B_Red",2,30]]],
	["B_Kitbag_rgr",[]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch","CUP_NVG_PVS15_black"]
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