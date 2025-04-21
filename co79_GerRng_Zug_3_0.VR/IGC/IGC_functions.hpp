class IGC_CF {
    class cf {
        file = "IGC\CF\fnc";

        // Open the dialog
        class openDialog {};

        class onCatChanged{};

        class updateCrateSelection{};

        class updateCrateContent{};

        class spawnCrate{};

        class initSupplyPoint{};

        class spawnExtraGear{};

        class onSupplyCatChange{};
        
        class adjustItems{};

        class addItemsFromSupply{};

        class clearCreateContent{};


        class limaOldSupplyCreateAce{};

        class limaOldSupplySpawnCrate{};

    };
};

class IGC_CE {
    class ce {
        file = "IGC\CE\fnc";

        class initCrateEditor{};

        class updateNearObjects{};

        class monitorInventories{};

        class onInventorySelect{};

        class onAddItem{};

        class onRemoveItem{};

        class onClearItems{};

        class onAddFromSupply{};


    };
};

class IGC_CL {
    class cl {
        file = "IGC\CL\fnc";

        class initCrateLoader{};

        class updateLists{};

        class updateCrates{};

        class updateVehicles{};

        class loadCargo{};

    };
};

class IGC_common {
    class main {
        file = "IGC\common\fnc";

        class switchDialog{};

        class getConfigPath{};

    };
};