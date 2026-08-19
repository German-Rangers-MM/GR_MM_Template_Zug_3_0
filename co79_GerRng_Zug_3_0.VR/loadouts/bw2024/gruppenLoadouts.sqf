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
	["JTAC / Nahsicherer","Zug_JTAC"]
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
	["Schütze-LMG","Schuetze_LMG"],
	["Schütze-Träger","Schuetze_Traeger"],
	["Breacher","Breacher"]
	
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
	["Kompaneführung","KpFhr"],
	["Kompanietruppführer","Kp_TF"]
];

//-----------------------------------------------------------------------------
//
//						Hotel - Zeus
//
//-----------------------------------------------------------------------------

GR_HotelRollen = [
	["Kompaneführung","KpFhr"]
];

//-----------------------------------------------------------------------------
//
//						Mike - San-Unterstützungs Einheit
//
//-----------------------------------------------------------------------------

GR_MikeRollen = [
	["Arzt vom Dienst","Mike_AvD"],
	["Nahsicherer (Mike)","Mike_NahSi"],
	["Sanitäter (Mike)","Mike_Sani"],
	["Leichter Sanitäter","Mike_SaniL"],
	["Sanitäter vom Dienst","Mike_SvD"],
	["Techniker","Mike_Tech"]
];

//-----------------------------------------------------------------------------
//
//						Lima - Unterstützungstrupp
//
//-----------------------------------------------------------------------------

GR_LimaRollen = [
	["Lima Führung","Lima_GF"],
	["Lima Pilot","Lima_Pilot"],
	["Lima Sanitäter","Lima_Sani"],
	["Lima Standard","Lima"]

];


//-----------------------------------------------------------------------------
//
//						Romeo - Feuerunterstützungstrupp
//
//-----------------------------------------------------------------------------

GR_RomeoRollen = [
	["Romeo Standard","Romeo"],
	["Romeo Gruppenführer","Romeo_GF"],
	["Romeo Späh Gruppenführer","Romeo_R_TF"],
	["Romeo Späh","Romeo_R"],
	["Romeo Späh Leichter Sanitäter","Romeo_R_LSan"]
];

//-----------------------------------------------------------------------------
//
//						Alle Rollen/ Loadouts (alphabetisch aufsteigend)
//
//-----------------------------------------------------------------------------

GR_AlleRollen = [
	["Breacher", "Breacher"],
	["Führungsassistent","FueAss"],
	["Grenadier","Grenadier"],
	["Gruppenführer","GrpFhr"],
	["Gruppenführer WaGru","GrpFhr_WaGru"],
	["Kompanieführung","KpFhr"],
	["Kompanietruppführer","Kp_TF"],
	["Lima Standard","Lima"],
	["Lima Führung","Lima_GF"],
	["Lima Pilot","Lima_Pilot"],
	["Lima Sanitäter","Lima_Sani"],
	["Arzt vom Dienst","Mike_AvD"],
	["Leichter Sanitäter","Mike_SaniL"],
	["Nahsicherer (Mike)","Mike_NahSi"],
	["Sanitäter (Mike)","Mike_Sani"],
	["Sanitäter vom Dienst","Mike_SvD"],
	["Techniker","Mike_Tech"],
	["Romeo Standard","Romeo"],
	["Romeo Pilot","Romeo_Pilot"],
	["Romeo Späh DM","Romeo_R_DM"],
	["Romeo Späh Grenadier","Romeo_R_Gren"],
	["Romeo Späh Truppführer","Romeo_R_TF"],
	["Romeo Truppführer","Romeo_TF"],
	["Sanitäter","Sanitaeter"],
	["Sanitäter WaGru","Sanitaeter_WaGru"],
	["Schütze","Schuetze"],
	["Schütze-EHB","Schuetze_EHB"],
	["Schütze-DM","Schuetze_DM"],
	["Schütze-LMG","Schuetze_LMG"],
	["Schütze-Träger","Schuetze_Traeger"],
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
	["Nahsicherer / JTAC","Zug_JTAC"],
	["Zug Sanitäter","ZugSani"]
];

//-----------------------------------------------------------------------------
//
//						Alle Packlisten (alphabetisch aufsteigend)
//
//-----------------------------------------------------------------------------

GR_Packlisten = [
	"Breacher",				
	"FueAss",
	"Grenadier",
	"GrpFhr",
	"GrpFhr_WaGru",
	"KpFhr",
	"Kp_TF",
	"Lima",
	"Lima_GF",
	"Lima_Pilot",
	"Lima_Sani",
	"Mike_AvD",
	"Mike_NahSi",
	"Mike_Sani",
	"Mike_SaniL",
	"Mike_SvD",
	"Mike_Tech",
	"Romeo",
	"Romeo_R",
	"Romeo_R_GF",
	"Romeo_R_LSan",
	"Romeo_GF",
	"Sanitaeter",
	"Sanitaeter_WaGru",
	"Schuetze",
	"Schuetze_DM",
	"Schuetze_EHB",
	"Schuetze_LMG",
	"Schuetze_Traeger",
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
	"ZugFhr",
	"Zug_JTAC",
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
	grpromeo
	grpfox
	grpvictor
	grpalpha
	grpbravo
	grpcharlie
	grpzulu
	grpxray
	grpyankee
	grpsierra


//-----------------------------------------------------------------------------
//
//						Neue groupID für Gruppen
//
//-----------------------------------------------------------------------------

	group this setGroupID ["Hotel"];
	group this setGroupID ["Kilo"];
	group this setGroupID ["Lima"];
	group this setGroupID ["Mike"];
	group this setGroupID ["Romeo"];
	group this setGroupID ["Foxtrot"];
	group this setGroupID ["Victor"];
	group this setGroupID ["Alpha"];
	group this setGroupID ["Bravo"];
	group this setGroupID ["Charlie"];
	group this setGroupID ["Zulu"];
	group this setGroupID ["X-Ray"];
	group this setGroupID ["Yankee"];
	group this setGroupID ["Sierra"];
	
*/
