//German Rangers Mission Feature Config Variables
useDBMapMarkers 	= false;		// Sets if MapMarkers from the DB are loaded for this mission
limaSupplyPoints	= true;			// Sets if a Lima Supply Point is available for all Players in Groups Lima and Kilo(Needs adjusted supply boxes in Lima folder for the Fraktion)
missionstartedfeat	= true;			// Sets if the "Mission Started"-Feature is available. When the Feature is "true", all Players have the GR GUI everywhere available until the Mission is started by Zeus
									// After the Mission was started, every JIP Player will be spawned in the Base, defined in initPlayerLocal.sqf. 
									// This is used for Missions that start in field. Needs the Mission Start Feature from Zeus!
dynamicGroupsFeat	= false;		// DynamicGroups_Function; Clients can then use action TeamSwitch ("U" by default) to access the Dynamic Groups interface.

// Loadouts 
loadPlayers 		= false;		// Sets if Loadouts for Players are loaded from DB
fraktion 			= "bw2024"; 	// Sets the Loadout Path for the Mission start: "bwfleck" | "marsoc"
tarnfarbe			= "bwfleck";	// Sets Camos of Faction: "bwfleck" | "bwtropen" | "bwwinter"

//avaible Factions via GUI
fraktionList[] 		= {"bw2023"}; 		// Deprecated
fraktionListN[] 	= {"Bundeswehr"}; 	// Deprecated

allowWaffenkammer	= true;			// Sets if the Waffenkammer is available ingame
allowLoadouts		= true;			// Sets if the Loadout Change is available ingame
rearm				= true;			// Sets if Weaponchange and Reload is enabled in Waffenkammer

//------------------------------------------------------------------
//------------------------------------------------------------------
//
//					Instant Intro Maker
//
//------------------------------------------------------------------
//------------------------------------------------------------------

intro 				= "Video";		// Choose the Intro Music that is played (please delete mmc_sequence_xxx.sqf files that you don't need and the corresponding intro soundfiles under sounds/)
									// "PR" Pacific Rim | Rockig, Episch | 0:42
									// "Rock" The Rock | Episch, Orchestral | 0:55
									// "Sic" Sicario | Düster, Elektronisch | 0:46
									// "BHD" Black Hawk Down | Düster, Ethnische Trommeln | 0:41
									// "KA" King Arthur | Episch, Laut | 0:58
									// "Video" Musik wird im Intro-File festgelegt

einleitung 			= "Viribus unitis";
auftrag 			= "Auftrag: <br/>1. Auftrag<br/>2. Auftrag<br/>3. Auftrag";
titleOrtEinheit		= "A L T I S - DD.MM.YYYY - German Rangers";
titleMissionsname 	= "Missionsname";

tickerCountry 		= "Altis, Ost-Region";
tickerLocation 		= "Map-Location";

outro 				= "Video";		// Hier kannst du die Musik wählen, die bei einem Erfolgreichen Missionsende gespielt wird Rock
									// "PR1" Pacific Rim | Rockig, Episch | 0:30
									// "PR2" Pacific Rim | Rockig, Episch, etwas schwerer als PR1 | 0:30
									// "Rock" The Rock | Episch, Orchestral | 0:40
									// "AFO" Air Force One | Militärisch, Klassisch, Orchester| 0:35
									// "MGS" Metal Gear Solid | Episch, Modern Orchestral, lang | 1:16
									// "Video" Musik wird im Intro-File festgelegt