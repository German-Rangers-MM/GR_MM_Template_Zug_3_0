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
					["Zug Sanitäter","ZugSani"],	
					["Fahrer", "ZugFahr"]				
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
					["Führungsassistent","FueAss"],
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
					["Waffen-Assi. Titan AA","Waffen_Assi_TitanAA"],
					["Waffen-Spezi. M2","Waffen_Spez_M2"],
					["Waffen-Assi. M2","Waffen_Assi_M2"],
					["Waffen-Spezi. Mk19","Waffen_Spez_Mk19"],
					["Waffen-Assi. Mk19","Waffen_Assi_Mk19"],
					["Waffen-Spezi. TOW","Waffen_Spez_TOW"],
					["Waffen-Assi. TOW","Waffen_Assi_TOW"],
					["Waffen-Spezi. Mörser","Waffen_Spez_Moerser"],
					["Waffen-Assi. Mörser","Waffen_Assi_Moerser"],
					["Spezialpionier Mörser","Spezialpionier_Moerser"],
					["Spezialpionier Tripod Normal","Spezialpionier_TriNorm"],
					["Spezialpionier Tripod Low","Spezialpionier_TriLow"],
					["Spezialpionier","Spezialpionier"]
];

//-----------------------------------------------------------------------------
//
//						Scharfschützentrupps
//
//-----------------------------------------------------------------------------

GR_ScharfRollen = [
					["Gruppenführer","Sierra_GrpFhr"],
					["Aufklärungssanitäter","Sierra_AufSan"],
					["Truppführer","Sierra_TF"],
					["Scharfschütze","Sierra_Scharf"],
					["Spotter","Sierra_Spotter"],
					["Aufklärer","Sierra_Aufkl"],
					["Breacher","Sierra_Breacher"],
					["LMG-Schütze","Sierra_MG"],
					["Sanitäter","Sierra_San"],
					["Nahsicherer","Sierra_NaSi"],
					["Schütze","Sierra_Schuetze"]				
];

//-----------------------------------------------------------------------------
//
//						Kilo - Kompanieführung
//
//-----------------------------------------------------------------------------

GR_KiloRollen = [
					["Standard","KpFhr"]					
];

//-----------------------------------------------------------------------------
//
//						Hotel - Zeus
//
//-----------------------------------------------------------------------------

GR_HotelRollen = [
					["Standard","KpFhr"]					
];

//-----------------------------------------------------------------------------
//
//						Mike - San-Unterstützungs Einheit
//
//-----------------------------------------------------------------------------

GR_MikeRollen = [
					["Arzt vom Dienst","Mike_AvD"],
					["Truppführer","Mike_TF"],
					["Sanitäter vom Dienst","Mike_SvD"],
					["Sanitäter (Mike)","Sanitaeter"],
					["Leichter Sanitäter","Mike_SaniL"],
					["Fahrer (Mike)","Mike_Fahrer"],
					["Techniker Mike","Mike_Techniker"],
					["Schütze (Mike)","Mike_SchM"]
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
					
					["Führungsassistent","FueAss"],
					["Grenadier","Grenadier"],
					["Gruppenführer","GrpFhr"],
					["Gruppenführer WaGru","GrpFhr_WaGru"],
					["Kompanieführer","KpFhr"],
					["Lima","Lima"],
					["Pilot","Lima_Pilot"],
					["Arzt vom Dienst","Mike_AvD"],
					["Fahrer","Mike_Fahrer"],
					["Sanitäter vom Dienst","Mike_SvD"],
					["Sanitäter (Mike)","Mike_Sani"],
					["Schütze (Mike)","Mike_SchM"],
					["Techniker","Mike_Techniker"],
					["Sanitäter Leicht","Mike_SaniL"],
					["Sanitäter","Sanitaeter"],
					["Sanitäter WaGru","Sanitaeter_WaGru"],
					["Schütze","Schuetze"],
					["Schütze-EHB","Schuetze_EHB"],
					["Schütze-DM","Schuetze_DM"],
					["Schütze-LMG","Schuetze_LMG"],
					["Gruppenführer","Sierra_GrpFhr"],
					["Aufklärungssanitäter","Sierra_AufSan"],
					["Truppführer","Sierra_TF"],
					["Scharfschütze","Sierra_Scharf"],
					["Spotter","Sierra_Spotter"],
					["Aufklärer","Sierra_Aufkl"],
					["Breacher","Sierra_Breacher"],
					["LMG-Schütze","Sierra_MG"],
					["Sanitäter","Sierra_San"],
					["Nahsicherer","Sierra_NaSi"],
					["Schütze","Sierra_Schuetze"],
					["Spezialpionier", "Spezialpionier"],
					["Truppführer","TrpFhr"],
					["Truppführer Mike", "Mike_TF"],
					["Waffen-Assi.","Waffen_Assi"],
					["Waffen-Spez.","Waffen_Spez"],
					["Fahrer", "ZugFahr"],
					["Zugführer","ZugFhr"],
					["Zug Sanitäter","ZugSani"]
];

//-----------------------------------------------------------------------------
//
//						Alle Packlisten (alphabetisch aufsteigend)
//
//-----------------------------------------------------------------------------

GR_Packlisten = [					
					"FueAss",
					"Grenadier",
					"GrpFhr",
					"GrpFhr_WaGru",
					"KpFhr",
					"Lima",
					"Mike_AvD",
					"Mike_Fahrer",
					"Mike_Sani",
					"Mike_SaniL",
					"Mike_SchM",
					"Mike_SvD",
					"Mike_TF",
					"Mike_Techniker",
					"Sanitaeter",
					"Sanitaeter_WaGru",
					"Schuetze",
					"Schuetze_DM",
					"Schuetze_EHB",
					"Schuetze_LMG",
					"Sierra_Aufkl",
					"Sierra_AufSan",
					"Sierra_Breacher",
					"Sierra_GrpFhr",
					"Sierra_MG",
					"Sierra_NaSi",
					"Sierra_San",
					"Sierra_Scharf",
					"Sierra_Schuetze",
					"Sierra_Spotter",
					"Sierra_TF",
					"Spezialpionier",
					"TrpFhr",
					"Waffen_Assi",
					"Waffen_Spez",
					"ZugFahr",
					"ZugFhr",
					"ZugSani"
];

/*

//-----------------------------------------------------------------------------
//
//						Neue Variablen für Gruppen
//
//-----------------------------------------------------------------------------

	grphotel
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

	group this setGroupID ["Hotel"];
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
