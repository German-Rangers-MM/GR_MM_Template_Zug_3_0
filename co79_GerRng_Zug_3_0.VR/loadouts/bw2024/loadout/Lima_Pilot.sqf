//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Lima_Pilot
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Lima_Pilot"];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_smg_MP7","","","",["CUP_40Rnd_46x30_MP7",40],[],""],
	[],
	["CUP_hgun_FlareGun","","","",["CUP_StarClusterRed_265_M",1],[],""],
	["CUP_U_B_USArmy_PilotOverall",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["Aircrew_vest_2_NH",[["CUP_NVG_GPNVG_black",1],["SmokeShellPurple",2,1],["SmokeShellGreen",2,1],["CUP_StarClusterRed_265_M",2,1],["CUP_40Rnd_46x30_MP7",3,40],["B_IR_Grenade",2,1]]],
	["TFAR_rt1523g_bwmod",[["CUP_H_Ger_Cap_Grn2",1]]],
	"CUP_H_SPH4_khaki","G_Aviator",[],
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