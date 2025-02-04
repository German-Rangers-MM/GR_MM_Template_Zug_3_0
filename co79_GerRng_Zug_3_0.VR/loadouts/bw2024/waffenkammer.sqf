/*
	Waffenkammer / Packliste / Loadout
	
	In der Waffenkammer können die Spieler ihr eigenes Loadout zusammenstellen.	
	Für jede Rolle gibt es eine entsprechende Packliste. (Gegenstände die im Arsenal verfügbar sind)	
	Aus dem Inhalt der Packliste ergeben sich dann die möglichen Loadouts.	
	
	Nachdem das Arsenal geschlossen wurde, wird es gelöscht. Dies ist nötig, damit bei einem
	Rollenwechsel die Items weiterhin korrekt dargestellt werden und nicht Items der vorigen
	Rolle angezeigt werden.
*/

// Im Fahrzeug lässt sich das Arsenal nicht öffen -> exit
if (!(isNull objectParent player)) exitWith {
	titleText ["<t color='#e5991a' size='1.8'>Packliste nicht verfügbar.<br/></t><t color='#ffffff' size='1.4'>Bitte aussteigen und erneut versuchen.</t>", "PLAIN DOWN", 1, true, true];	
};

// Get Player Role
_unitLoadout = player getVariable "GR_unitLoadout";

// Needed for waitUntil after Arsenal is closed, combined with Event Handler on Arsenal
player setVariable ["GR_arsenalClosed", false];

_rearm = false;

if (getMissionConfigValue "rearm" == "true") then {
	_rearm = true;
};

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//						Arsenal Erstellen
//
//------------------------------------------------------------------
//------------------------------------------------------------------

// Packliste passend zur Rolle laden
_packListe = [];

{
	if ([_x,_unitLoadout] call BIS_fnc_inString) then {	
		_packListe = call compile preprocessFileLineNumbers format ["loadouts\%1\packliste\%2.sqf", fraktionV, _x];	
	};
} forEach GR_Packlisten;

// Packliste Leer -> Arsenal aus dem Inventar des Spielers erstellen
if ((count _packListe) < 1) then  {
	_packListe = flatten (getUnitLoadout player);
};

private _uniqueWeaponSelection = [
	"Schuetze_DM",
	"Schuetze_LMG",
	"Grenadier"
];
if(!(_unitLoadout in _uniqueWeaponSelection)) then {
    _gemeinsameWaffen = call compile preprocessFileLineNumbers format ["loadouts\%1\packliste\GemeinsameWaffen.sqf", fraktionV];
    _packListe append _gemeinsameWaffen;
};

private _417blacklist =[
	"Schuetze_EHB",
	"Schuetze_LMG",
	"Grenadier",
	"GrpFhr",
	"GrpFhr_WaGru",
	"Spezialpionier",
	"Waffen_Spez",
	"Waffen_Assi",
	"ZugFhr",
	"ZugSani"
];
if(!(_unitLoadout in _417blacklist)) then {
    //HK417
	_HK417 = 
	[
		//HK417
		"CUP_arifle_HK417_12",
		"CUP_arifle_HK417_12_Desert",
		"CUP_arifle_HK417_12_Wood",
		"CUP_20Rnd_762x51_HK417",
		"CUP_20Rnd_762x51_HK417_Camo_Desert",
		"CUP_20Rnd_762x51_HK417_Camo_Wood",
		"CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"
	];
    _packListe append _HK417;
};
//Kleidung und items
_gemeinsamesMaterial = call compile preprocessFileLineNumbers format ["loadouts\%1\packliste\GemeinsamesMaterial.sqf", fraktionV];
_packListe append _gemeinsamesMaterial;

// Zusatz Material
_zusatzMaterial = call compile preprocessFileLineNumbers format ["loadouts\%1\packliste\ZusatzMaterial.sqf", fraktionV];
_packListe append _zusatzMaterial;

// Fill ACE Arsenal
[player, _packListe, false] call ace_arsenal_fnc_addVirtualItems;

// Open ACE Arsenal
_waffenkammer = [player, player, false] call ace_arsenal_fnc_openBox;

// Message for Player which options are available
if _rearm then {
	titleText [format ["<t color='#ffffff' size='1.4'><t color='#e5991a' size='1.8'>Packliste %1</t><br/> steht in vollem Umfang zur Verfügung.<br/><br/>Nach Waffenwechsel AUFMUNITIONIEREN nicht vergessen!</t>",_unitLoadout], "PLAIN DOWN", 1, true, true]; 
}
else {	
	titleText ["<t color='#ffffff' size='1.4'>Die Mission wird fortgesetzt<br/></t><t color='#ff0000' size='1.8'>Es ist weder ein Waffenwechsel noch Aufmunitionieren möglich.</t>", "PLAIN DOWN", 1, true, true];
};

// Add Event Handler for closing the Arsenal
GR_ARSENAL_DISPLAY_ID = ["ace_arsenal_displayClosed", { player setVariable ["GR_arsenalClosed", true]; ["ace_arsenal_displayClosed", GR_ARSENAL_DISPLAY_ID] call CBA_fnc_removeEventHandler; } ] call CBA_fnc_addEventHandler;

// Wait until Arsenal is closed by Player
waitUntil { player getVariable "GR_arsenalClosed" };

// clear Arsenal
[player, true, false] call ace_arsenal_fnc_removeVirtualItems;
