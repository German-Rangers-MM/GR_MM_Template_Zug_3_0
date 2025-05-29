//------------------------------------------------------------------
//------------------------------------------------------------------
//
//	Waffen_Spez_TitanAT
//
//------------------------------------------------------------------
//------------------------------------------------------------------
player setVariable ["GR_unitLoadout","Waffen_Spez_TitanAT",true];

//	https://community.bistudio.com/wiki/Unit_Loadout_Array
player setUnitLoadout [
	["CUP_arifle_G36KA3_grip_wdl","","CUP_acc_LLM_od","CUP_optic_Elcan_SpecterDR_RMR_od",["CUP_30Rnd_556x45_G36_wdl",30],[],""],
	["launch_B_Titan_short_tna_F","","","",["Titan_AT",1],[],""],
	["CUP_hgun_M17_Black","","","",["CUP_17Rnd_9x19_M17_Black",17],[],""],
	["CUP_U_B_GER_Fleck_Crye",[["ACE_fieldDressing",5],["ACE_elasticBandage",5],["ACE_packingBandage",5],["kat_chestSeal",2],["ACE_morphine",1],["ACE_salineIV_500",2],["ACE_splint",2],["ACE_tourniquet",2],["ACE_CableTie",2],["ACE_EarPlugs",1],["ItemcTabHCam",1],["ACE_IR_Strobe_Item",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1]]],
	["GRE_PlateCarrier1_Flecktarn",[["CUP_NVG_PVS15_black",1],["CUP_HandGrenade_M67",2,1],["SmokeShell",2,1],["CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",2,30],["CUP_30Rnd_556x45_G36_wdl",6,30]]],
	["B_AssaultPack_rgr",[["Titan_AT",1,1]]],
	"CUP_H_OpsCore_Covered_Fleck_SF","",[],
	["ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ItemWatch",""]
];