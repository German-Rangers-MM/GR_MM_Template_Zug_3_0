//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Spezialpionier_TriLow
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Spezialpionier_TriLow"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36K_RIS_AG36","","CUP_acc_LLM_black","CUP_optic_Elcan_SpecterDR_KF_RMR_black",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
	["ace_csw_m3CarryTripodLow","","","",[],[],""],
	[],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_salineIV_500",2]]],
	["GRE_PlateCarrier1_Flecktarn",[["ACE_HuntIR_monitor",1],["muzzle_antenna_01_f",1],["ACE_wirecutter",1],["CUP_NVG_PVS15_black",1],["SmokeShell",2,1],["CUP_HandGrenade_M67",2,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",3,30],["ACE_HuntIR_M203",4,1],[["hgun_esd_01_F","muzzle_antenna_02_f","","",[],[],""],1]]],
	["CUP_B_GER_Medic_Flecktarn",[["ace_marker_flags_red",10],["ace_marker_flags_white",10],["ACE_DefusalKit",1],["ACE_M26_Clacker",1],["DemoCharge_Remote_Mag",4,1],[["ACE_VMM3","","","",[],[],""],1]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",["Rangefinder","","","",[],[],""],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch",""]
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