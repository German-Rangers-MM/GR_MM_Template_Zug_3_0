class GVAR(schuetze){
    displayName = "Schütze";

    groupType = "schuetzen_grp";

    class weaponPrimary {
        weaponClass = "CUP_arifle_G36KA3_grip_wdl";
        weaponMuzzle = "";
        weaponAttachment = "CUP_acc_LLM_od";
        weaponOptic = "CUP_optic_Elcan_SpecterDR_RMR_od";
        weaponMagazinePrimary[] = {"CUP_30Rnd_556x45_G36_wdl",30};
        weaponMagazineSecondary[] = {};
        weaponBipod = "CUP_Bipod_G36_wood";
    };

    class weaponLauncher {
        weaponClass = "";
        weaponMuzzle = "";
        weaponAttachment = "";
        weaponOptic = "";
        weaponMagazinePrimary[] = {};
        weaponMagazineSecondary[] = {};
    };

    class weaponPistol {
        weaponClass = "CUP_hgun_M17_Black";
        weaponMuzzle = "";
        weaponAttachment = "";
        weaponOptic = "";
        weaponMagazinePrimary[] = {"CUP_17Rnd_9x19_M17_Black",17};
        weaponMagazineSecondary[] = {};
    };

    class uniform {
        uniformClass = "CUP_U_B_GER_Fleck_Crye";
        uniformItems[] = {
            {"ACE_fieldDressing",5},
            {"ACE_elasticBandage",5},
            {"ACE_packingBandage",5},
            {"kat_chestSeal",2},
            {"ACE_morphine",1},
            {"ACE_salineIV_500",2},
            {"ACE_splint",2},
            {"ACE_tourniquet",2},
            {"ACE_CableTie",2},
            {"ACE_EarPlugs",1},
            {"ItemcTabHCam",1},
            {"ACE_IR_Strobe_Item",2},
            {"ACE_Flashlight_XL50",1},
            {"ACE_MapTools",1}
        };
    };

    class vest {
        vestClass = "gerrng_PlateCarrier1_Flecktarn";
        vestItems[] = {
            {"CUP_NVG_PVS15_black",1},
            {"ACE_EntrenchingTool",1},
            {"ACE_wirecutter",1},
            {"GerRng_rations_HydrationBladder_3L",1},
            {"CUP_17Rnd_9x19_M17_Black",2,17},
            {"HandGrenade",3,1},
            {"SmokeShell",3,1},
            {"CUP_30Rnd_556x45_G36_wdl",8,30},
            {"CUP_30Rnd_TE1_Red_Tracer_556x45_G36_wdl",4,30}
        };
    };

    class backpack {
        backpackClass = "";
        backpackItems[] = {};
    };

    headgearClass = "CUP_H_OpsCore_Covered_Fleck_SF";

    facewearClass = "";

    class designator {
        designatorClass = "";
        designatorMagazine[] = {};
    };

    class assignedItems {
        map = "ItemMap";
        gps = "";
        radio = "TFAR_anprc152";
        compass = "ItemCompass";
        watch = "ItemWatch";
        nvg = "";
    };

    isMedic = 0;
    isEngineer = 0;
    isEOD = 0;

    hasCommonWeapons = 1;
    hasCommonMagazines = 1;
    hasCommonThrowables = 1;
    hasCommonAttachments = 1;
    hasCommonUniforms = 1;
    hasCommonItems = 1;

    uniqueItems[] = {};
};


class GVAR(schuetze_dm): GVAR(schuetze){
    displayName = "Schütze (DM)";

    class weaponPrimary {
        weaponClass = "SPS_hk417_20_vfg_black_f";
        weaponMuzzle = "";
        weaponAttachment = "sps_M300C_MAWL_LAMG_IR";
        weaponOptic = "SPS_Optic_SnB_HP_1_8_Black";
        weaponMagazinePrimary[] = {"CUP_20Rnd_762x51_DMR",20};
        weaponMagazineSecondary[] = {};
        weaponBipod = "CUP_bipod_Harris_1A2_L_BLK";
    };

    class vest : vest {
        vestClass = "gerrng_PlateCarrier1_Flecktarn";
        vestItems[] = {
            {"CUP_NVG_PVS15_black",1},
            {"ACE_EntrenchingTool",1},
            {"SPS_PVS24LR",1},
            {"GerRng_rations_HydrationBladder_3L",1},
            {"CUP_17Rnd_9x19_M17_Black",2,17},
            {"SmokeShell",4,1},
            {"CUP_HandGrenade_M67",2,1},
            {"SPS_20Rnd_762x51mm_M80A1_EPR",8,20}
        };
    };

    class designator {
        designatorClass = "Rangefinder";
        designatorMagazine[] = {};
    };

    
    hasCommonWeapons = 0;
    hasCommonMagazines = 1;
    
    uniqueItems[] = {
        "CUP_arifle_HK417_20",
        "CUP_arifle_HK417_20_Desert",
        "CUP_arifle_HK417_20_Wood",
        "arifle_SPAR_03_blk_F",
        "arifle_SPAR_03_snd_F",
        "arifle_SPAR_03_khk_F",
        "SPS_hk416_20_black_f",
        "SPS_hk416_20_hk_sf_black_f",
        "SPS_hk416_20_hk_a7_black_f",
        "SPS_hk416_20_vfg_black_f",
        "SPS_hk416_20_hk_vfg_sf_black_f",
        "SPS_hk416_20_hk_vfg_a7_black_f",
        "SPS_hk416_20_afg_black_f",
        "SPS_hk416_20_hk_afg_sf_black_f",
        "SPS_hk416_20_hk_afg_a7_black_f",
        "SPS_hk416_20_hk_ctr_black_f",
        "SPS_hk416_20_hk_ctr_sf_black_f",
        "SPS_hk416_20_hk_ctr_a7_black_f",
        "SPS_hk416_20_hk_ctr_vfg_black_f",
        "SPS_hk416_20_hk_ctr_vfg_sf_black_f",
        "SPS_hk416_20_hk_ctr_vfg_a7_black_f",
        "SPS_hk416_20_hk_ctr_afg_black_f",
        "SPS_hk416_20_hk_ctr_afg_sf_black_f",
        "SPS_hk416_20_hk_ctr_afg_a7_black_f",
        "SPS_hk416_20_g95_black_f",
        "SPS_hk416_20_g95_hk_sf_black_f",
        "SPS_hk416_20_g95_hk_a7_black_f",
        "SPS_hk416_20_g95_vfg_black_f",
        "SPS_hk416_20_g95_hk_vfg_sf_black_f",
        "SPS_hk416_20_g95_hk_vfg_a7_black_f",
        "SPS_hk416_20_g95_afg_black_f",
        "SPS_hk416_20_g95_hk_afg_sf_black_f",
        "SPS_hk416_20_g95_hk_afg_a7_black_f",
        "SPS_hk416_20_g95_hk_ctr_black_f",
        "SPS_hk416_20_g95_hk_ctr_sf_black_f",
        "SPS_hk416_20_g95_hk_ctr_a7_black_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_black_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_sf_black_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_a7_black_f",
        "SPS_hk416_20_g95_hk_ctr_afg_black_f",
        "SPS_hk416_20_g95_hk_ctr_afg_sf_black_f",
        "SPS_hk416_20_g95_hk_ctr_afg_a7_black_f",
        "SPS_hk416_20_exsmr_black_f",
        "SPS_hk416_20_exsmr_hk_sf_black_f",
        "SPS_hk416_20_exsmr_hk_a7_black_f",
        "SPS_hk416_20_exsmr_vfg_black_f",
        "SPS_hk416_20_exsmr_hk_vfg_sf_black_f",
        "SPS_hk416_20_exsmr_hk_vfg_a7_black_f",
        "SPS_hk416_20_exsmr_afg_black_f",
        "SPS_hk416_20_exsmr_hk_afg_sf_black_f",
        "SPS_hk416_20_exsmr_hk_afg_a7_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_sf_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_a7_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_sf_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_a7_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_sf_black_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_a7_black_f",
        "SPS_hk416_20_exsl_black_f",
        "SPS_hk416_20_exsl_hk_sf_black_f",
        "SPS_hk416_20_exsl_hk_a7_black_f",
        "SPS_hk416_20_exsl_vfg_black_f",
        "SPS_hk416_20_exsl_hk_vfg_sf_black_f",\
        "SPS_hk416_20_exsl_hk_vfg_a7_black_f",
        "SPS_hk416_20_exsl_afg_black_f",
        "SPS_hk416_20_exsl_hk_afg_sf_black_f",
        "SPS_hk416_20_exsl_hk_afg_a7_black_f",
        "SPS_hk416_20_exsl_hk_ctr_black_f",
        "SPS_hk416_20_exsl_hk_ctr_sf_black_f",
        "SPS_hk416_20_exsl_hk_ctr_a7_black_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_black_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_sf_black_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_a7_black_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_black_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_sf_black_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_a7_black_f",
        "SPS_hk417_20_vfg_black_f",
        "SPS_hk417_20_afg_black_f",
        "SPS_hk417_20_vfg_ral8000_f",
        "SPS_hk417_20_afg_ral8000_f",
        "SPS_hk417_20_vfg_fde_f",
        "SPS_hk417_20_afg_fde_f",
        "SPS_hk416_20_ral8000_f",
        "SPS_hk416_20_hk_sf_ral8000_f",
        "SPS_hk416_20_hk_a7_ral8000_f",
        "SPS_hk416_20_vfg_ral8000_f",
        "SPS_hk416_20_hk_vfg_sf_ral8000_f",
        "SPS_hk416_20_hk_vfg_a7_ral8000_f",
        "SPS_hk416_20_afg_ral8000_f",
        "SPS_hk416_20_hk_afg_sf_ral8000_f",
        "SPS_hk416_20_hk_afg_a7_ral8000_f",
        "SPS_hk416_20_hk_ctr_ral8000_f",
        "SPS_hk416_20_hk_ctr_sf_ral8000_f",
        "SPS_hk416_20_hk_ctr_a7_ral8000_f",
        "SPS_hk416_20_hk_ctr_vfg_ral8000_f",
        "SPS_hk416_20_hk_ctr_vfg_sf_ral8000_f",
        "SPS_hk416_20_hk_ctr_vfg_a7_ral8000_f",
        "SPS_hk416_20_hk_ctr_afg_ral8000_f",
        "SPS_hk416_20_hk_ctr_afg_sf_ral8000_f",
        "SPS_hk416_20_hk_ctr_afg_a7_ral8000_f",
        "SPS_hk416_20_g95_ral8000_f",
        "SPS_hk416_20_g95_hk_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_a7_ral8000_f",
        "SPS_hk416_20_g95_vfg_ral8000_f",
        "SPS_hk416_20_g95_hk_vfg_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_vfg_a7_ral8000_f",
        "SPS_hk416_20_g95_afg_ral8000_f",
        "SPS_hk416_20_g95_hk_afg_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_afg_a7_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_a7_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_vfg_a7_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_afg_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_afg_sf_ral8000_f",
        "SPS_hk416_20_g95_hk_ctr_afg_a7_ral8000_f",
        "SPS_hk416_20_exsmr_ral8000_f",
        "SPS_hk416_20_exsmr_hk_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_a7_ral8000_f",
        "SPS_hk416_20_exsmr_vfg_ral8000_f",
        "SPS_hk416_20_exsmr_hk_vfg_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_vfg_a7_ral8000_f",
        "SPS_hk416_20_exsmr_afg_ral8000_f",
        "SPS_hk416_20_exsmr_hk_afg_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_afg_a7_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_a7_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_vfg_a7_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_sf_ral8000_f",
        "SPS_hk416_20_exsmr_hk_ctr_afg_a7_ral8000_f",
        "SPS_hk416_20_exsl_ral8000_f",
        "SPS_hk416_20_exsl_hk_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_a7_ral8000_f",
        "SPS_hk416_20_exsl_vfg_ral8000_f",
        "SPS_hk416_20_exsl_hk_vfg_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_vfg_a7_ral8000_f",
        "SPS_hk416_20_exsl_afg_ral8000_f",
        "SPS_hk416_20_exsl_hk_afg_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_afg_a7_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_a7_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_vfg_a7_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_sf_ral8000_f",
        "SPS_hk416_20_exsl_hk_ctr_afg_a7_ral8000_f",

        "CUP_optic_AC11704_Black",
        "CUP_optic_AC11704_tan",
        "CUP_optic_AC11704_OD",
        "CUP_optic_Elcan_SpecterDR_RMR_black",
        "CUP_optic_Elcan_SpecterDR_RMR",
        "CUP_optic_Elcan_SpecterDR_RMR_od",
        "CUP_optic_Elcan_SpecterDR_KF_RMR_black",
        "CUP_optic_Elcan_SpecterDR_KF_RMR",
        "CUP_optic_Elcan_SpecterDR_KF_RMR_od",
        "CUP_optic_Elcan_reflex",
        "CUP_optic_Elcan_reflex_Coyote",
        "CUP_optic_Elcan_reflex_OD",
        "optic_Holosight_blk_F",
        "optic_Holosight",
        "optic_Holosight_lush_F",
        "optic_Holosight_smg_blk_F",
        "optic_Holosight_smg",
        "optic_Holosight_smg_khk_F",
        "CUP_optic_HensoldtZO_low",
        "CUP_optic_HensoldtZO_low_desert",
        "CUP_optic_HensoldtZO_low_od",
        "CUP_optic_HensoldtZO_low_RDS",
        "CUP_optic_HensoldtZO_low_RDS_desert",
        "CUP_optic_HensoldtZO_low_RDS_od",
        "CUP_optic_ZeissZPoint",
        "CUP_optic_ZeissZPoint_desert",
        "CUP_optic_ZeissZPoint_wood",
        "optic_AMS",
        "optic_AMS_snd",
        "optic_AMS_khk",
        "optic_NVS",
        "SPS_Optic_SnB_HP_1_8_Black_PVS24LR",
        "SPS_Optic_SnB_HP_1_8_FDE_PVS24LR",
        "SPS_Optic_SnB_HP_1_8_RAL8000_PVS24LR",
        "SPS_Optic_SnB_HP_1_8_Black",
        "SPS_Optic_SnB_HP_1_8_FDE",
        "SPS_Optic_SnB_HP_1_8_RAL8000",
        "SPS_EOTech_Vudu_Black_PVS24LR",
        "SPS_EOTech_Vudu_Tan_PVS24LR",
        "SPS_EOTech_Vudu_Black",
        "SPS_EOTech_Vudu_Tan",
        "sps_aimpoint_T1_Black",
        "sps_aimpoint_T1_Black50",
        "sps_aimpoint_T1_Sand",
        "sps_aimpoint_T1_Sand50",
        "sps_aimpoint_T1_3xMAG_up_Black",
        "sps_aimpoint_T1_3xMAG_up",
        "sps_aimpoint_T1_Black_High",
        "sps_aimpoint_T1_Black_High50",
        "sps_aimpoint_T1_High",
        "sps_aimpoint_T1_High50",
        "SPS_EOTech_Black",
        "SPS_EOTech_Black50",
        "SPS_EOTech_Tan",
        "SPS_EOTech_Tan50",
        "SPS_EOTech_Black_3xMAG_up",
        "SPS_EOTech_Tan_3xMAG_up",
        "SPS_EOTech_Black_5xMAG_up",
        "SPS_EOTech_Tan_5xMAG_up",

        "CUP_20Rnd_762x51_HK417",
        "CUP_20Rnd_762x51_HK417_Camo_Desert",
        "CUP_20Rnd_762x51_HK417_Camo_Wood",
        "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417",
        "ACE_20Rnd_762x51_M993_AP_Mag",
        "ACE_20Rnd_762x51_Mag_Tracer",
        "CUP_20Rnd_762x51_DMR",
        "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR",
        "SPS_HKG3PMAG_30Rnd_556x45_B_BeOTMT",
        "SPS_HKG3PMAG_30Rnd_556x45_B_BeVLDT",
        "SPS_20Rnd_762x51mm_M80A1_EPR",
        "SPS_20Rnd_762x51mm_M80A1_EPR_IR",
        "SPS_20Rnd_762x51mm_M80A1_EPR_Tracer",
        "SPS_HKG3PMAG_30Rnd_556x45_B",
        "SPS_HKG3PMAG_30Rnd_556x45_B_Red",
        "SPS_HKG3PMAG_30Rnd_556x45_B_M995",
        "SPS_HKG3PMAG_30Rnd_556x45_B_Mk318",
        "SPS_HKG3PMAG_30Rnd_556x45_FDE",
        "SPS_HKG3PMAG_30Rnd_556x45_FDE_Red",
        "SPS_HKG3PMAG_30Rnd_556x45_FDE_M995",
        "SPS_HKG3PMAG_30Rnd_556x45_FDE_Mk318",
        "SPS_HKG3PMAG_30Rnd_556x45_S",
        "SPS_HKG3PMAG_30Rnd_556x45_S_Red",
        "SPS_HKG3PMAG_30Rnd_556x45_S_M995",
        "SPS_HKG3PMAG_30Rnd_556x45_S_Mk318",

        "GerRng_bandoliers_grenade_3_3_flare_hand",
        "GerRng_bandoliers_rifle_5_5_417_30Rnd"
    };
};

class GVAR(schuetze_lmg): GVAR(schuetze){
    displayName = "Schütze (LMG)";

    class weaponPrimary {
        weaponClass = "CUP_lmg_minimi_railed";
        weaponMuzzle = "";
        weaponAttachment = "";
        weaponOptic = "CUP_optic_Elcan_SpecterDR_RMR_black";
        weaponMagazinePrimary[] = {"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",200};
        weaponMagazineSecondary[] = {};
        weaponBipod = "";
    };

    class vest : vest {
        vestClass = "gerrng_PlateCarrier1_Flecktarn";
        vestItems[] = {
            {"CUP_NVG_PVS15_black",1},
            {"ACE_EntrenchingTool",1},
            {"GerRng_rations_HydrationBladder_3L",1},
            {"CUP_17Rnd_9x19_M17_Black",1,17},
            {"CUP_HandGrenade_M67",2,1},
            {"SmokeShell",2,1},
            {"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",2,200}
        };
    };

    class backpack : backpack {
        backpackClass = "CFP_Camelbak_Mule_RngrGrn";
        backpackItems[] = {
            {"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",3,200}
        };
    };

    hasCommonWeapons = 0;
    hasCommonMagazines = 0;

    uniqueItems[] = {
        "CUP_lmg_minimi_railed",

        "CUP_arifle_MG36",
        "CUP_arifle_MG36_camo",
        "CUP_arifle_MG36_wdl",

        "LMG_03_F",
        "CUP_V_B_GER_Pvest_Fleck_MG",
        "CUP_V_B_GER_Pvest_Trop_MG",

        "CUP_V_B_GER_Pvest_Fleck_MG_LT",
        "CUP_V_B_GER_Pvest_Trop_MG_LT",
        "CUP_200Rnd_TE4_Red_Tracer_556x45_M249",

        "CUP_100Rnd_556x45_BetaCMag",
        "CUP_100Rnd_556x45_BetaCMag_camo",
        "CUP_100Rnd_556x45_BetaCMag_wdl",

        "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag",
        "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_camo",
        "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_wdl",
        "GerRng_bandoliers_mg_4_4_m249_200Rnd"
    };

};

class GVAR(schuetze_ehb) : GVAR(schuetze){
    displayName = "Schütze (EHB)";

    class weaponPrimary {
        weaponClass = "CUP_arifle_G36KA3_grip_wdl";
        weaponMuzzle = "";
        weaponAttachment = "CUP_acc_LLM_od";
        weaponOptic = "CUP_optic_Elcan_SpecterDR_RMR_od";
        weaponMagazinePrimary[] = {"CUP_30Rnd_556x45_G36_wdl",30};
        weaponMagazineSecondary[] = {};
        weaponBipod = "";
    };

    class uniform : uniform {
        uniformClass = "CUP_U_B_GER_Fleck_Crye";
        uniformItems[] = {
            {"ACE_fieldDressing",5},
            {"ACE_elasticBandage",5},
            {"ACE_packingBandage",5},
            {"kat_chestSeal",2},
            {"ACE_morphine",1},
            {"ACE_salineIV_500",2},
            {"ACE_splint",2},
            {"ACE_tourniquet",2},
            {"ACE_CableTie",2},
            {"ACE_EarPlugs",1},
            {"ItemcTabHCam",1},
            {"ACE_IR_Strobe_Item",2},
            {"ACE_Flashlight_XL50",1},
            {"ACE_MapTools",1}
        };
    };

    class vest : vest {
        vestClass = "gerrng_PlateCarrier1_Flecktarn";
        vestItems[] = {
            {"CUP_NVG_PVS15_black",1},
            {"GerRng_rations_HydrationBladder_3L",1},
            {"CUP_17Rnd_9x19_M17_Black",1,17},
            {"SmokeShell",2,1},
            {"CUP_HandGrenade_M67",2,1},
            {"CUP_30Rnd_TE1_Red_Tracer_556x45_G36",2,30},
            {"CUP_30Rnd_556x45_G36_wdl",6,30}
        };
    };

    class backpack : backpack {
        backpackClass = "B_Kitbag_rgr";
        backpackItems[] = {
            {"ACE_adenosine",5},
            {"ACE_fieldDressing",20},
            {"ACE_elasticBandage",30},
            {"ACE_packingBandage",20},
            {"ACE_bodyBag",2},
            {"ACE_epinephrine",10},
            {"ACE_morphine",1},
            {"ACE_salineIV_500",20},
            {"ACE_splint",10},
            {"ACE_tourniquet",2},
            {"kat_IV_16",10},
            {"kat_BVM",1},
            {"kat_chestSeal",10},
            {"kat_fentanyl",5},
            {"kat_larynx",15},
            {"kat_nitroglycerin",5},
            {"kat_TXA",5},
            {"kat_Penthrox",1,10}
        };
    };

    isMedic = 1;

    uniqueItems[] = {
        "B_Kitbag_cbr_Medic",
        "B_Kitbag_rgr_Medic",
        "B_Kitbag_tan_Medic",
        "ACE_adenosine",
        "ACE_bodyBag",
        "ACE_epinephrine",
        "ACE_salineIV",
        "ACE_splint",

        "kat_IV_16",
        "kat_Carbonate",
        "kat_BVM",
        "kat_EACA",
        "kat_IO_FAST",
        "kat_fentanyl",
        "kat_ketamine",
        "kat_larynx",
        "kat_naloxone",
        "kat_nitroglycerin",
        "kat_Penthrox",
        "kat_TXA",
        "kat_Pulseoximeter",
        "kat_stethoscope",
        "kat_ncdKit",
        
        "GerRng_kat_changes_glucometerSet",
        "GerRng_kat_changes_GSCI",
        "kat_CarryStretcherBag",
        "ace_marker_flags_black",
        "ace_marker_flags_blue",
        "ace_marker_flags_orange",
        "ace_marker_flags_purple",
        "ace_marker_flags_red",
        "ace_marker_flags_white",
        "ace_marker_flags_yellow",
        "ace_marker_flags_green"
    };
};
