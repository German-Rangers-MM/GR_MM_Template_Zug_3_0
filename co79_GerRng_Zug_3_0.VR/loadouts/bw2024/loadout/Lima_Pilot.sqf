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
	["CUP_smg_MP5A5","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_9x19_MP5",30],[],""],
	[],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Overalls_Pilot",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["CUP_V_B_PilotVest",[["CUP_NVG_PVS15_black",1],["30Rnd_9x21_Mag_SMG_02",5,30],["SmokeShellPurple",2,1],["SmokeShellGreen",2,1]]],
	["TFAR_rt1523g_big_bwmod",[["ToolKit",1]]],
	"H_PilotHelmetHeli_B","",[],
	["ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ItemWatch",""]
];

//------------------------------------------------------------------
//	ACE Optionen fuer Spieler
//------------------------------------------------------------------
//	Medic:
player setVariable ["ACE_medical_medicClass",2,true];

//	Combat Engineer:
player setVariable ["ACE_isEngineer",2,true];

//	Explosive Specialist:
player setVariable ["ACE_isEOD",true,true];

//	Waffe sichern
player setVariable ["ace_safemode_safedweapons", []];
[ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety;