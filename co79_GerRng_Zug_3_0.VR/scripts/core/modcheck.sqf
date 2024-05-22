_whitelistedMods = 	[
						"@CBA_A3", "450814997",
						"@ace", "463939057",
						"@ACE 3 Extension (Placeables)", "866772689",
						"@KAT - Advanced Medical", "2020940806",
						"@Zeus Enhanced", "1779063631",
						"@Zeus Enhanced - ACE3 Compatibility", "2018593688",

						// Missionmaker Mods
						"@3den Enhanced", "623475643",
						"@ZEC - Zeus and Eden Templates - Building Compositions", "642912021",
						"@ZEI - Zeus and Eden Interiors", "1251859358",
						"@ZECCUP - Zeus and Eden Templates for CUP Terrains", "750186990",
						
						// CUP
						"@CUP Terrains - Core", "583496184",
						"@CUP Terrains - CWA", "853743366",
						"@CUP Terrains - Maps", "583544987",
						"@CUP Terrains - Maps 2.0", "1981964169",
						"@CUP Units", "497661914",
						"@CUP Vehicles", "541888371",		
						"@CUP Weapons", "497660133",
						"@CUP ACE3 Compatibility Addon - Weapons", "549676314",
						"@CUP ACE3 Compatibility Addon - Vehicles", "621650475",
						"@CUP ACE3 Compatibility Addon - Terrains", "1375890861",
						"@Community Factions Project (CFP)", "1369691841",
						
						//TFAR
						"@Task Force Arrowhead Radio (BETA!!!)", "894678801",
						"@Radio Animations for Task Force Radio", "1480333388",

						//German Rangers Extras
						"@NATO Markers+", "1340701737",
						"@cTab", "871504836",
						"@Enhanced Movement", "333310405",
						"@Enhanced Movement Rework", "2034363662",
						"@German Rangers Equipment", "2996640864",
						"@cTab 1erGTD", "2262006564",
						"@SIT 1erGTD", "2262009445",
						"@MAAWS Additional Ammo Types", "2589302544",
						"@Gruppe Adler Trenches", "1224892496",
						"@TWC 2 Inch Mortar", "1670017422",
						"@M224 60mm Mortar (ACE)", "2472780935",

						//Additional Maps
						"@Jbad", "520618345",
						"@Bala Murghab, Afghanistan", "2781043850",
						"@Anizay", "1537973181",
						"@LYTHIUM", "909547724",
						"@Rosche, Germany", "1527410521",
						"@UMB Colombia", "2266710560",
						"@Hellanmaa", "1291778160",
						"@G.O.S N'Djenahoud", "937515516",
						"@Korsac", "3043043427",
						"@G.O.S Al Rayak", "648172507",
						"@Sanagasta Map", "2466229756",
						"@Bornhom [R]", "2914536900",

						//----------------------------------
						//
						//	Additional Client Side Mods
						//
						//----------------------------------
						
						//Gameplay
						"@Suppress", "825174634",
						"@Immerse", "825172265",
						"@CH View Distance", "837729515",
						"@Better Inventory", "2791403093",
						"@Window Breaker", "1578884800",
						"@Brush Clearing", "1889104923",
						"@Arsenal Search", "2060770170",
						"@ACE 3 Extension (Animations and Actions)", "766491311",
						"@Enhanced GPS", "2480263219",
						"@Dismount Where You Look", "1841553455",
						"@Ride Where You Look", "2153127400",
						"@Project Infinite - Inspect weapons", "812441729",
						"@9Liners & Notepad", "1210050323",
						"@ACE Compat CUP Facewear", "2614664632",
						"@Head Range Plus - TrackIR Mod", "630737877",
						"@cb_blood", "2362277256",
						"@Enhanced Map Ace Version", "2467590475",
						"@Simplex Support Services", "1850026051",
						"@DUI - Squad Radar", "1638341685",
						"@BackpackOnChest - Redux", "2372036642",
						
						//Visual
						"@Blastcore Edited (standalone version)", "767380317",
						"@Vanilla smoke (for Blastcore Edited)", "853303947",	
						"@Blastcore Murr Edition Smoke Alternative", "2478519591",
						"@Blastcore Murr Edition", "2257686620",
						"@Dynamic Lights Extended", "2429580300",
						"@Real Lighting and Weather", "2809399991",
						"@Cinematic Lens Flare", "878502647",
						"@Splendid Lighting Modification", "2070681304",
						"@Fixed Splendid Lighting Modification", "2979710855",
						"@Cinematic Lens Flare x Splendid Lighting Compatibility", "2715797525",
						"@Reduced Haze Mod v3.1", "1397683809",
						"@Bullets_Hit", "2190826124",
						"@ArmaFXP - Smoke Edit", "2147472177",
						"@Lushify", "2638049909",
						"@ReColor", "649832908",
						"@Fawks' Enhanced NVGs", "2513044572",
						"@BettIR (Legacy v0.2.1)", "2260572637",
						"@German Rangers Intro 29-04-2024", "3234631841",
						
						
						//Sound
						"@DynaSound 2", "825181638",
						"@Enhanced Soundscape", "825179978",
						"@Enhanced Soundscape Plus", "2938312887",
						"@LAxemann's Environment Ducking", "2812569803",
						"@JSRS SOUNDMOD", "861133494",
						"@JSRS SOUNDMOD - CUP WEAPONS MOD SOUND SUPPORT", "1624803912",
						"@JSRS SOUNDMOD - CUP VEHICLES MOD SOUND SUPPORT", "1624804924",
						"@JSRS SOUNDMOD - Reloading Sounds", "1429098683",
						
						
						//Zeus Mods
						"ASR AI3", "642457233",

						"@Crows Zeus Additions", "2447965207",
						
						
						//Arma 3 Expansions
						"expansion",
						"kart",
						"heli",
						"mark",
						"jets",
						"argo",
						"orange",
						"tacops",
						"tank",
						"enoch",
						"aow",
						"curator"
					];


private _playermods = [];

_loadedMods = configSourceModList (configFile >> "CfgPatches");

{
	_result = false;
	_result = _x in _whitelistedMods;
	if (_result == false )then {
		_playermods pushBack _x;
	};		
} forEach _loadedMods;

if(count _playermods > 0) then {
	(format ["%1 is using Blacklisted Mods: %2",profileName, _blacklisthits]) remoteExec ["diag_log", 2];
	_playermessage = format ["<t color='#ff0000' size='3'>Du benutzt Mods die nicht auf der Whitelist stehen.</t><br/><t color='#ffffff' size='1.5'> Bitte starte das Spiel erneut und entferne die Mods aus deinem Preset: %1 </t>", _playermods];
	titleText [_playermessage, "BLACK FADED", 100, true, true];

	//Teleport to Cage of Shame:
	player setPos getPos blacklistcage;
};
