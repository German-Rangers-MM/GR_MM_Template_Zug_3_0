/*	
	by SmartGun	
	
 	Description:	
	Ersetzt für die Fraktion "bw2024" Flecktarn Equipment mit Tropentarn oder Winter
	
 	Paramameters:	
	tarnfarbeV
	
	Return values:
	-none	
	
	[tarnfarbeV] call SGN_fnc_replaceTarnfarbe;
*/
params ["_tarn"];

if (_tarn in ["bwtropen","bwwinter"]) then {
	
	// get current Loadout from player
	private _LoadoutArray = getUnitLoadout player;	
		
	private _uniform	= "";
	private _weste 		= "";
	private _ruck 		= "";
	private _helm 		= "";		
	
	// Tropentarn
	if (_tarn == "bwtropen") then {			
		// Uniform
		switch (uniform player) do {
			case "CUP_U_B_GER_Flecktarn_1": { _uniform = "CUP_U_B_GER_Tropentarn_1"; };
			case "CUP_U_B_GER_Flecktarn_2": { _uniform = "CUP_U_B_GER_Tropentarn_2"; };
			case "CUP_U_B_GER_Flecktarn_3": { _uniform = "CUP_U_B_GER_Tropentarn_3"; };
			case "CUP_U_B_GER_Flecktarn_4": { _uniform = "CUP_U_B_GER_Tropentarn_4"; };
			case "CUP_U_B_GER_Flecktarn_5": { _uniform = "CUP_U_B_GER_Tropentarn_5"; };
			case "CUP_U_B_GER_Flecktarn_6": { _uniform = "CUP_U_B_GER_Tropentarn_6"; };
			case "CUP_U_B_GER_Flecktarn_7": { _uniform = "CUP_U_B_GER_Tropentarn_7"; };
			case "CUP_U_B_GER_Flecktarn_8": { _uniform = "CUP_U_B_GER_Tropentarn_8"; };
			case "CUP_U_B_GER_Fleck_Crye": 	{ _uniform = "CUP_U_B_GER_Crye"; };	
			case "CUP_U_B_GER_Fleck_Crye2": { _uniform = "CUP_U_B_GER_Crye2"; };
		};	
		// Weste
		switch (vest player) do {
			case "CUP_V_B_GER_PVest_Fleck_Gren": 	{ _weste = "CUP_V_B_GER_PVest_Trop_Gren" };
			case "CUP_V_B_GER_PVest_Fleck_Gren_LT": { _weste = "CUP_V_B_GER_PVest_Trop_Gren_LT" };
			case "GRE_PlateCarrier1_Flecktarn": 	{ _weste = "GRE_PlateCarrier1_Tropentarn" };
			case "CUP_V_B_GER_Armatus_BB_Fleck":	{ _weste = "CUP_V_B_GER_Armatus_BB_Trop" }					
		};
		// Rucksack
		switch (backpack player) do {
			case "B_AssaultPack_rgr": 			{ _ruck = "B_AssaultPack_cbr" };
			case "B_Carryall_green_F": 			{ _ruck = "B_Carryall_cbr" };
			case "B_Kitbag_rgr": 				{ _ruck = "B_Kitbag_tan" };
			case "CUP_B_GER_Pack_Flecktarn": 	{ _ruck = "CUP_B_GER_Pack_Tropentarn" };				
			case "CUP_B_GER_Medic_Flecktarn": 	{ _ruck = "CUP_B_GER_Medic_Tropentarn" };
			case "CFP_Camelbak_Mule_RngrGrn": 	{ _ruck = "CFP_Camelbak_Mule_Drab" };
			case "B_FieldPack_green_F": 		{ _ruck = "B_FieldPack_cbr" };
			case "ace_gunbag": 					{ _ruck = "ace_gunbag_Tan" };
		};
		// Helm
		switch (headgear player) do {
			case "CUP_H_Ger_M92_Cover": 				{ _helm = "CUP_H_Ger_M92_Cover_Trop" };
			case "CUP_H_Ger_M92_Cover_GG_CB": 			{ _helm = "CUP_H_Ger_M92_Cover_Trop_GG_CB" };
			case "CUP_H_Ger_M92_Cover_GG_CF": 			{ _helm = "CUP_H_Ger_M92_Cover_Trop_GG_CF" };
			case "CUP_H_Ger_M92_Cover_GG": 				{ _helm = "CUP_H_Ger_M92_Cover_Trop_GG" };
			case "CUP_H_OpsCore_Covered_Fleck": 		{ _helm = "CUP_H_OpsCore_Covered_Tropen" };
			case "CUP_H_OpsCore_Covered_Fleck_NoHS": 	{ _helm = "CUP_H_OpsCore_Covered_Tropen_NoHS" };
			case "CUP_H_OpsCore_Covered_Fleck_SF": 		{ _helm = "CUP_H_OpsCore_Covered_Tropen_SF" };	
			case "CUP_H_Ger_Boonie2_Flecktarn": 		{ _helm = "CUP_H_Ger_Boonie2_desert" };	
			case "CUP_H_Ger_Boonie_Flecktarn": 			{ _helm = "CUP_H_Ger_Boonie_desert" };
			case "H_HelmetSpecB_wdl": 					{ _helm = "H_HelmetSpecB_sand" };	
		};					
	};
	
	// Wintertarn
	if (_tarn == "bwwinter") then {
	
	};
	
	// Items in Loadout Array ersetzen
	if (_uniform != "") then 	{ _LoadoutArray set [3, [_uniform, nil]]; };
	if (_weste != "") 	then 	{ _LoadoutArray set [4, [_weste, nil]]; };
	if (_ruck != "") 	then	{ _LoadoutArray set [5, [_ruck, nil]]; };
	if (_helm != "") 	then 	{ _LoadoutArray set [6, _helm]; };
	
	// apply modified Loadout
	player setUnitLoadout _LoadoutArray;
};	