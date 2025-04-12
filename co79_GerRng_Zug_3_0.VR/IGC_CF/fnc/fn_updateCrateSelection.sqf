params ["_combo", "_index"];

private _dialog = ctrlParent _combo;
private _listbox = _dialog displayCtrl 220911;
private _category = _combo lbData _index;

private _selections = [];

// Clear existing list
lbClear _listbox;

// Add items based on category
switch (_category) do {
    case "zug": {
        _selections = [
            ["Typ 1 - Munition", limapfad + "box_zug_typ_1.sqf"],
            ["Typ 2 - LMG-Munition", limapfad + "box_zug_typ_2.sqf"],
            ["Typ 3 - Unterlaufgranaten",limapfad + "box_zug_typ_3.sqf"],
            ["Typ 4 - Granaten",limapfad + "box_zug_typ_4.sqf"],
            ["Typ 5 - Ausrüstung",limapfad + "box_zug_typ_5.sqf"],
            ["Typ 6 - Anti-Tank",limapfad + "box_zug_typ_6.sqf"],
            ["Typ 7 - Elektronik",limapfad + "box_zug_typ_7.sqf"],
            ["Typ 8 - Munition HK417",limapfad + "box_zug_typ_8.sqf"],
            ["Typ 9 - Flashbangs",limapfad + "box_zug_typ_9.sqf"]
        ];
    };

    case "wagru": {
        _selections = [
            ["Typ 1 - MG3", limapfad + "box_wagru_typ_1.sqf"],
            ["Typ 2 - Mk48", limapfad + "box_wagru_typ_2.sqf"],
            ["Typ 3 - MAAWS",limapfad + "box_wagru_typ_3.sqf"],
            ["Typ 4 - MAAWS Sondermunition",limapfad + "box_wagru_typ_4.sqf"],
            ["Typ 5 - Titan AT",limapfad + "box_wagru_typ_5.sqf"],
            ["Typ 6 - Titan AA",limapfad + "box_wagru_typ_6.sqf"],
            ["Typ 7 - Metis",limapfad + "box_wagru_typ_7.sqf"],
            ["Typ 8 - Combat Engineering",limapfad + "box_wagru_typ_8.sqf"]
        ];
    };

    case "wagruStatic": {
        _selections = [
            ["Typ 1 - M2 Waffe", limapfad + "box_wagrustat_typ_1.sqf"],
            ["Typ 2 - M2 Munition", limapfad + "box_wagrustat_typ_2.sqf"],
            ["Typ 3 - Mk19 Waffe",limapfad + "box_wagrustat_typ_3.sqf"],
            ["Typ 4 - Mk19 Munition",limapfad + "box_wagrustat_typ_4.sqf"],
            ["Typ 5 - TOW Waffe",limapfad + "box_wagrustat_typ_5.sqf"],
            ["Typ 6 - TOW Munition",limapfad + "box_wagrustat_typ_6.sqf"],
            ["Typ 7 - 82mm Mörser Waffe",limapfad + "box_wagrustat_typ_7.sqf"],
            ["Typ 8 - 82mm Munition HE",limapfad + "box_wagrustat_typ_8.sqf"],
            ["Typ 9 - 82mm Sondermunition",limapfad + "box_wagrustat_typ_9.sqf"],
            ["Typ 10 - 60mm Mörser u. Standardmun",limapfad + "box_wagrustat_typ_10.sqf"],
            ["Typ 11 - 60mm Sondermunition",limapfad + "box_wagrustat_typ_11.sqf"]
        ];
    };

    case "eod": {
        _selections = [
            ["Typ 1 - Anzug", limapfad + "box_eod_typ_1.sqf"],
            ["Typ 2 - Drohne", limapfad + "box_eod_typ_2.sqf"],
            ["Typ 3 - Ausrüstung",limapfad + "box_eod_typ_3.sqf"],
            ["Typ 4 - Zug",limapfad + "box_eod_typ_4.sqf"]
        ];
    };
    
    case "cbrn": {
        _selections = [
            ["Typ 1 - CBRN-Schutz", limapfad + "box_cbrn_typ_1.sqf"],
            ["Typ 2 - CBRN-Erkundung", limapfad + "box_cbrn_typ_2.sqf"],
            ["Typ 3 - CBRN-UGV",limapfad + "box_cbrn_typ_3.sqf"]
        ];
    };
    
    case "san": {
        _selections = [
            ["Typ 1 - SanMat", limapfad + "box_san_typ_1.sqf"],
            ["Typ 2 - Leichensäcke", limapfad + "box_san_typ_2.sqf"]
        ];
    };

    case "sierra": {
        _selections = [
            ["Typ 1- Trupp 1 - S", limapfad + "box_sierra_typ_1.sqf"],
            ["Typ 2 - Trupp 1 - A", limapfad + "box_sierra_typ_2.sqf"],
            ["Typ 3 - Trupp 2 - U",limapfad + "box_sierra_typ_3.sqf"],
            ["Typ 4 - Trupp 2 - ST",limapfad + "box_sierra_typ_4.sqf"],
            ["Typ 5 - Ausrüstung",limapfad + "box_sierra_typ_5.sqf"]
        ];
    };
    case "supply": {
        _selections = [
            ["Transportbox", limapfad + "box_supply.sqf"]
        ];
    };
};

_selections apply {
    _x params ["_name", "_file"];
    private _index = _listbox lbAdd _name;
    _listbox lbSetData [_index, _file];
};