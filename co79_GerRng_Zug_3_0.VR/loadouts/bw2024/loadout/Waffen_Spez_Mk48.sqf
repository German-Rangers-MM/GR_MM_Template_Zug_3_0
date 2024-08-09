//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Waffen_Spez_Mk48
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Waffen_Spez_Mk48"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_lmg_Mk48_nohg","","CUP_acc_LLM_black","CUP_optic_Elcan_SpecterDR_RMR_black",["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",100],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["SmokeShell",2,1],["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",4,100]]],
	["CFP_Camelbak_Mule_RngrGrn",[["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",1,100]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",[],
	["ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch",""]
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