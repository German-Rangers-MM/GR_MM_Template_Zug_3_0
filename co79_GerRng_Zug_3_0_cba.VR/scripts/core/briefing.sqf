/*
    briefing.sqf
	wird in der initPlayerLocal eingebunden und ausgeführt.
    
    Briefingeinträge werden mit createDiaryRecord erstellt.
    Der Text der einzelnen Einträge kann noch mit folgenden Befehlen formatiert
    werden:
    <br/>                                               			- Zeilenumbruch
    <t/>                                                			- Einrücken (Tabulator)
    <img image='BILDPFAD' width='200' height='200'/>    			- Bild einbinden
    <marker name='MARKER'>TEXT</marker>                 			- Verlinkung auf Marker
    <execute expression='CODE'>TEXT</execute>           			- Code ausführen
	<font face='PuristaMedium' size=14 color='#fc9300'>TEXT</font>			- Schriftyp, Textgröße, Farbe, 
	https://community.bistudio.com/wiki/FXY_File_Format#Arma_3
 */

_gerrng = player createDiarySubject ["GerRng","German Rangers"];

player createDiaryRecord ["GerRng",["Mission Control Center","
<font face='PuristaMedium' size=18 color='#fc9700'>Mission Control Center</font><br/>
<br/>
Das Mission Control Center ist ein Menü für den Zeus / Kilo. Es ist nur in der Zeus Ansicht über ACE (standardmäßig 'WINDOWS-Taste') aufrufbar.<br/>
Hier kann die Mission gestartet werden. Danach ist das Base Menü nur noch in der Basis verfügbar (wichtig bei Missionen wo die Spieler im Feld starten). Spieler die nachjoinen oder reconnecten starten in der Basis.<br/>
<br/>
Es gibt aber auch zwei verschiedene Enden ('To Be Continued' für den Fall das die Mission nicht beendet wurde und zu einem späteren Zeitpunkt fortgesetzt wird, 'Mission Erfüllt' für den Fall das die Mission erfolgreich abgeschlossen wurde).<br/>
Jedes Ende beendet die Mission mit einer kurzen Abschlusssequenz für alle Spieler. Die Dokumentation des Missionsstand durch den Zeus muss vorher erfolgen. Manuelles ausloggen ist nicht erforderlich.<br/>
<br/>
Jede Funktion benötigt eine Bestätigung über ein Interface bevor diese ausgeführt wird.<br/>
<br/>
Zusätzlich können Missionsbauer extra Chapter einbauen mit denen die Zeuse bestimmte Ereignisse triggern können. Diese sind dann im Missionsskript zu beschreiben.<br/>
"]];

player createDiaryRecord ["GerRng",["Lima Supply Point","
<font face='PuristaMedium' size=18 color='#fc9700'>Lima Supply Point</font><br/>
<br/>
Am Lima Supply Point können Nachschubkisten gespawned werden die vorgefertigte Inhalte haben. Jede Kiste kann über ACE getragen oder gezogen werden und kann in den ACE Storage von Fahrzeugen verladen und entladen werden.<br/>
In den Missionen gibt es meist einen Statischen Supply Point (meist dargestellt durch einen Vehicle Service Point) und einen mobilen Supply Point (meist ein HEMTT Cargo).<br/>
<br/>
Bei dem statischen Supply Point wird die Kiste an einer Markierung auf dem Boden vor dem Supply Point gespawnt.<br/>
Bei dem mobilen Supply Point spawnt die Kiste am Heck des Fahrzeuges.<br/>
<br/>
Es sollte darauf geachtet werden, dass nicht mehrere Kisten hintereinander gespawnt werden.<br/>
<br/>
Die Funktion zum spawnen der Kisten kann über das ACE Interaction Menü aufgerufen werden (standardmäßig 'WINDOWS-Taste') und ist NUR sichtbar wenn man in der Gruppe Lima oder Kilo geslottet hat.
"]];

player createDiaryRecord ["GerRng",["Base Menü","
<font face='PuristaMedium' size=18 color='#fc9700'>GerRng Base Menü</font><br/>
<br/>
<font face='PuristaMedium' size=14 color='#fc9700'>Aufruf</font><br/>
<br/>
Das Base Menü ist innerhalb der Basis und überall vor Missionsstart aufrufbar. Auf den Übungsplätzen sind alle Funktionen des Base Menüs überall und jederzeit erreichbar.<br/>
Ihr erreicht es über das ACE Self-Interaction Menü (Standard 'STRG + WINDOWS').<br/>
<br/>
Innerhalb des Base Menüs gibt es drei Optionen:<br/>
<br/>
<font face='PuristaMedium' size=14 color='#fc9700'>1. Teleport</font><br/>
<br/>
Hier könnt ihr euch zu einer der Gruppen Teleportieren. Klickt auf die Gruppe und dann auf Teleport.<br/>
Der Teleport funktioniert auch für Gruppenführer UND wenn der Gruppen- oder Truppführer in einem Fahrzeug sitzt in dem ein weiterer Sitzplatz frei ist!<br/>
<br/>
<font face='PuristaMedium' size=14 color='#fc9700'>2. Loadouts</font><br/>
<br/>
Öffnet eine Loadout Liste mit den Standard-Loadouts entsprechend eurer Gruppenzugehörigkeit (Zug, Sierra, Echo, Lima).<br/>
Wählt ein Loadout aus der Liste in der Mitte und klickt dann auf den Button 'Take Loadout'.<br/>
<br/>
Wenn ihr das Loadout einer anderen Gruppe ausprobieren wollt, klickt auf das German Ranger Logo oben rechts. Nun seht ihr in der Spalte 'Loadouts' die verfügbaren Gruppen.<br/>
<br/>
<font face='PuristaMedium' size=14 color='#fc9700'>3. Waffenkammer</font><br/>
<br/>
Die Waffenkammer ist ein ACE Arsenal über das ihr eure Ausrüstung individualisieren könnt. Sie ist eurer Rolle entsprechend vorgefiltert. Das bedeutet ALLES was ihr auswählen könnt, ist für eure Rolle freigegeben.<br/>
<br/>
<font face='PuristaMedium' size=14 color='#ff0000'>Wenn ihr eine Waffe wechselt müsst ihr selber darauf achten entsprechend Magazine wieder in euer Inventar zu laden!</font><br/>
<br/>
Wenn eine Mission von vorher fortgesetzt wird, ist die Waffenkammer nur eingeschränkt verfügbar. Ihr könnt dann eure Waffe nicht wechseln und auch kein Material aufmunitionieren. In diesem Fall ist die Waffenkammer rein kosmetisch.<br/>
"]];
/*
_diary = player createDiaryRecord ["Diary", ["Credits", "
mission by: SmartGun
<br/>
<br/>
<img image ='\a3\data_f_oldman\logos\arma3_oldman_logo_ca.paa' width='64' height='64'/>
<br/>
<br/>
v01: 10.04.2024
"]];

player createDiaryRecord ["Diary",["Hintergrund","
Mit dem russischen Militäreinsatz seit September 2015 in Syrien greift die Russische Föderation auf Seiten der Regierung Syriens in den Syrienkrieg ein.
<br/>
<br/>
Die syrischen Armee konnte große Teile des Staatsterritoriums wieder unter Kontrolle bringen. 
Der Militäreinsatz gilt für Russland auch politisch als erfolgreich, weil die Russische Föderation somit wieder auf Augenhöhe mit den USA handeln kann.
<br/>
<br/>
Als die Militäroffensive der syrischen Regierungstruppen im Gouvernement Al Rayak stockte, wurden die Einsätze durch russischen Truppen unterstützt.
Ohne offizielle Bestätigung war Ende August 2023 jedoch unklar, ob aktive Soldaten russischer Spezialeinheiten oder lediglich russische Söldner in die Kämpfe eingegriffen haben.
<br/>
<img image='a3\missions_f_tank\data\img\Tanks02_CA.paa' width='367' height='256'/>
<br/>
Das Eingreifen in den Bürgerkrieg ist geprägt durch eine Kriegführung, die wenig Rücksicht auf die Zivilbevölkerung nimmt, bzw. sogar ganz bewusst zivile Ziele wie Wohngebiete, Schulen und Krankenhäuser angreift.
Nach Einschätzungen der NATO soll die operative Leitung im Gebiet Al Rayak hauptsächlich von einem russischen Kommandeur geleitet werden.
<br/>
<br/>
Die NATO hat eine Rapid Deployment Force gegen das rücksichtslose Vorgehen der russischen Streitkräfte in der Operation:
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>Alliance for Syrian Stability and Protection from Autocracy (ASSPA)</font>
<br/>
im Gebiet Al Raykak initiiert.
<br/>
<br/>
In einem Eilverfahren hat die Deutsche Bundesregierung ein Mandat für einen Bundeswehreinsatz beschlossen.
"]];

player createDiaryRecord ["Diary",["Verlauf","
<font face='PuristaMedium' size=12 color='#fc9700'>Alliance for Syrian Stability and Protection from Autocracy (ASSPA)</font>
<br/>
Mit beginn des Februars 2024 wurde die Operation gestartet.
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 1 - Operation Strike First - 5. 02. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 2 - Operation Pathfinding - 12. 02. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>AASPA 3 - Operation Argus - 12. 02. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 4 - Operation Tigerschlag - 12. 02. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 5 - Operation Löwenherz - 12. 02. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 6 - Operation Alamo - 08. 04. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 7 - Operation Jagdfieber - 15. 04. 2024</font>
<br/>
<br/>
<font face='PuristaMedium' size=12 color='#fc9700'>ASSPA 8 - Operation Finale - 22. 03. 2024</font>
<br/>
"]];

player createDiaryRecord ["Diary",["Ausstattung","
<font face='PuristaMedium' size=14 color='#fc9700'>Fahrzeuge</font>
<br/>
<font face='PuristaMedium' size=8 color='#fc9700'>Freigabe durch Kilo, Bereitstellung durch LIMA</font>
<br/>
<br/>
- Iveco Transport  Mobile Supply Truck 
<br/>
- Iveco Transport | 17 Sitze  | 4mal
<br/>
- Fennek AvD | 4 Sitze 
<br/>
- Fennek | 4 Sitze | 2mal
<br/>
- Dingo | 6 Sitze | 2mal
<br/>
<br/>
- Iveco Repair | 3 Sitze 
<br/>
- Iveco Fuel | 3 Sitze
<br/>
- Iveco Ammunition | 3 Sitze
<br/>
<br/>
- M1129 Mortar Carrier 
<br/>
- Wiesel ATGM
<br/>
- Wiesel Cannon
<br/>
- Sprinter | 2mal
<br/>
<br/>
<font face='PuristaMedium' size=14 color='#fc9700'>Helicopter</font><br/>
<font face='PuristaMedium' size=8 color='#fc9700'>Freigabe durch Kilo, Nutzung NUR LIMA</font>
<br/>
<br/>
- AW101 Merlin | TK 16 | 2mal
<br/>
- CH-47F | TK 27 | 2mal
<br/>
- CH-146 Aufklärung
<br/>
- CH-146 Transport | TK 11
<br/>
- CH-146 MedEvac | TK 4
"]];

player createDiaryRecord ["Diary",["Auftrag","
<font face='PuristaMedium' size=14 color='#fc9700'>ASSPA 7 - Jagdfieber</font>
<br/>
<br/>
Sie befinden sich am Flugfeld von <marker name='respawn_west'>Al Safyrah</marker>.
<br/>
<br/>
<marker name='m_syrPos'>Verbündete syrische Kräfte</marker> konnten eine LZ westlich von Dayr Hafir sichern.
<br/>
<br/>
1. Verlegen Sie vollständig zur <marker name='m_lzCondor'>LZ Condor</marker>.
<br/>
<br/>
2. Nehmen Sie das <marker name='PMCMarker'>PMC-Camp</marker> und finden Sie Cpt. Wagner und Dr. Oetker.
<br/>
"]];
*/

/*
// tasks ==================================================================================================================
task1 = player createSimpleTask ["Verlegen"];
task1 setSimpleTaskDescription ["Verlegen Sie zur <marker name='JablehMarker'>Jableh</marker> um generelles Intel zu erlangen.", "Verlegen","Move"];
task1 setSimpleTaskDestination markerpos "JablehMarker";
task1  setSimpleTaskType "help";

//Choose first mission task =================================================================================================
player setCurrentTask task1;
*/