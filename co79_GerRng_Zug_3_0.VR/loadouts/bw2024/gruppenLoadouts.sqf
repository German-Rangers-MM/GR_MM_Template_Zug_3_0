/*
	Hier werden den Spieler-Gruppen Loadouts/Rollen zugeordnet.
	Die Rollen können innerhalb der Gruppe per GUI gewechselt werden.
	Jede Gruppe hat ihre eigenen Rollen zugeordnet.
	
	Die Einträge haben das Format ["Display Name","Loadout"];
	"Display Name" 	-> Name des Loadouts welcher im GUI angezeigt wird; Umlaute und Leerzeichen sind möglich
	"Loadout"		-> Name der Loadoutdatei ohne ".sqf"; Umlaute und Leerzeichen sind NICHT erlaubt. Es können aber mehrere Loadouts für die gleiche Rolle angelegt werden.
						Dabei muss der Anfang des Loadout-Namens immer gleich bleiben damit die korekte Packliste zugeordent wird. Z.B. Waffen_Spez / Waffen_Spez_HMG / Waffen_Spez_GMG / Waffen_Spez_HAT usw.
*/

//-----------------------------------------------------------------------------
//
//						Zugführung
//
//-----------------------------------------------------------------------------

GR_ZugFhrRollen = [
					["Zugführer","ZugFhr"],
					["Zug Sanitäter","ZugSani"]					
];

//-----------------------------------------------------------------------------
//
//						Schützengruppe
//
//-----------------------------------------------------------------------------

GR_SchuetzenRollen = [
					["Gruppenführer","GrpFhr"],
					["Truppführer","TrpFhr"],
					["Sanitäter","Sanitaeter"],
					["Grenadier","Grenadier"],
					["Schütze","Schuetze"],
					["Schütze-DM","Schuetze_DM"],
					["Schütze-EHB","Schuetze_EHB"],
					["Schütze-LMG","Schuetze_LMG"]																
];

//-----------------------------------------------------------------------------
//
//						Waffengruppe
//
//-----------------------------------------------------------------------------

GR_WaffenRollen = [
					["Gruppenführer WaGru","GrpFhr_WaGru"],
					["Sanitäter WaGru","Sanitaeter_WaGru"],
					["Waffen-Spez.","Waffen_Spez"],
					["Waffen-Assi.","Waffen_Assi"],
					["Waffen-Spez. MAAWS","Waffen_Spez_Maaws"],
					["Waffen-Assi. MAAWS","Waffen_Assi_Maaws"],
					["Waffen-Spez. Metis","Waffen_Spez_Metis"],
					["Waffen-Assi. Metis","Waffen_Assi_Metis"],
					["Waffen-Spez. Mk48","Waffen_Spez_Mk48"],
					["Waffen-Assi. Mk48","Waffen_Assi_Mk48"],
					["Waffen-Spez. Titan AT","Waffen_Spez_TitanAT"],
					["Waffen-Assi. Titan AT","Waffen_Assi_TitanAT"],
					["Waffen-Spez. Titan AA","Waffen_Spez_TitanAA"],
					["Waffen-Assi. Titan AA","Waffen_Assi_TitanAA"]
];

//-----------------------------------------------------------------------------
//
//						Scharfschützentrupps
//
//-----------------------------------------------------------------------------

GR_ScharfRollen = [
					["Gruppenführer","Sierra_GrpFhr"],
					["Scharfschütze","Sierra_Scharf"],
					["Nahsicherer","Sierra_NaSi"]				
];

//-----------------------------------------------------------------------------
//
//						Kilo - Kompanieführung
//
//-----------------------------------------------------------------------------

GR_KiloRollen = [
					["Standard","ZugFhr"]					
];

//-----------------------------------------------------------------------------
//
//						Mike - San-Unterstützungs Einheit
//
//-----------------------------------------------------------------------------

GR_MikeRollen = [
					["Arzt vom Dienst","Mike_AvD"],
					["Sanitäter","Sanitaeter"],
					["Nahsicherer","Mike_NaSi"],
					["Fahrer","Mike_Fahrer"]
];

//-----------------------------------------------------------------------------
//
//						Lima - Unterstützungstrupp
//
//-----------------------------------------------------------------------------

GR_LimaRollen = [
					["Standard","Lima"],
					["Pilot","Lima_Pilot"]
];

//-----------------------------------------------------------------------------
//
//						Alle Rollen/ Loadouts (alphabetisch aufsteigend)
//
//-----------------------------------------------------------------------------

GR_AlleRollen = [
					["Grenadier","Grenadier"],
					["Gruppenführer","GrpFhr"],
					["Gruppenführer WaGru","GrpFhr_WaGru"],
					["Lima","Lima"],
					["Pilot","Lima_Pilot"],
					["Arzt vom Dienst","Mike_AvD"],
					["Fahrer","Mike_Fahrer"],
					["Nahsicherer","Mike_NaSi"],
					["Sanitäter","Mike_Sani"],
					["Sanitäter","Sanitaeter"],
					["Sanitäter WaGru","Sanitaeter_WaGru"],
					["Schütze","Schuetze"],
					["Schütze-EHB","Schuetze_EHB"],
					["Schütze-DM","Schuetze_DM"],
					["Schütze-LMG","Schuetze_LMG"],
					["Gruppenführer","Sierra_GrpFhr"],
					["Nahsicherer","Sierra_NaSi"],
					["Scharfschütze","Sierra_Scharf"],
					["Truppführer","TrpFhr"],
					["Waffen-Assi.","Waffen_Assi"],
					["Waffen-Spez.","Waffen_Spez"],
					["Zugführer","ZugFhr"],					
					["Zug Sanitäter","ZugSani"]							
];

//-----------------------------------------------------------------------------
//
//						Alle Packlisten (alphabetisch aufsteigend)
//
//-----------------------------------------------------------------------------

GR_Packlisten = [					
					"Grenadier",
					"GrpFhr",
					"GrpFhr_WaGru",					
					"Lima",							
					"Mike_AvD",
					"Mike_Fahrer",
					"Mike_NaSi",
					"Mike_Sani",
					"Sanitaeter",
					"Sanitaeter_WaGru",
					"Schuetze",					
					"Schuetze_DM",
					"Schuetze_EHB",
					"Schuetze_LMG",						
					"Sierra_GrpFhr",
					"Sierra_NaSi",
					"Sierra_Scharf",
					"TrpFhr",
					"Waffen_Assi",
					"Waffen_Spez",
					"ZugFhr",
					"ZugSani"
];

/*

//-----------------------------------------------------------------------------
//
//						Neue Variablen für Gruppen
//
//-----------------------------------------------------------------------------

	grpkilo
	grplima
	grpmike
	grpfox
	grpvictor
	grpalpha
	grpbravo
	grpcharlie
	grpzulu
	grpxray
	grpyankee
	grpsierra
	grpwhiskey	


//-----------------------------------------------------------------------------
//
//						Neue groupID für Gruppen
//
//-----------------------------------------------------------------------------

	group this setGroupID ["Kilo"];
	group this setGroupID ["Lima"];
	group this setGroupID ["Mike"];
	group this setGroupID ["Foxtrott"];
	group this setGroupID ["Victor"];
	group this setGroupID ["Alpha"];
	group this setGroupID ["Bravo"];
	group this setGroupID ["Charlie"];
	group this setGroupID ["Zulu"];
	group this setGroupID ["X-Ray"];
	group this setGroupID ["Yankee"];
	group this setGroupID ["Sierra"];
	group this setGroupID ["Whiskey"];	
	
*/