// Stops running the Sequence on the Server. Needs to be commented out for local Testing.
if (isServer) exitWith {};

//Start Music


playMusic "MyIntro";

titleText ["<t color='#ffffff' size='2'>01.08.2022. 3 Stunden vor Abzug der German Rangers.</t>", "BLACK OUT", 2, true, true];

sleep 4;

_camera = "camera" camCreate [8361.84,7120.07,5];
_camera cameraEffect ["internal","back"];

showCinemaBorder true;

//Garage Shot
_camera camSettarget camTarget_1;
_camera camSetPos [8457.25,7120.81,5];
_camera camCommit 10;
titleText ["<t color='#ffffff' size='2'>In den letzten 24h wurden große Teile der NATO Operation aus Anizay abgeflogen</t>", "PLAIN DOWN", 0.8, true, true];
waitUntil { camCommitted _camera; };

_camera camSettarget camTarget_2;
_camera camSetPos [8454.32,7194.83,30];
_camera camCommit 0;
_camera camSetPos [8444.59,7040.46,30];
_camera camCommit 8;
titleText ["<t color='#ffffff' size='2'>Die German Ranger konnten am Vortag Kontakt zu Afghanischen Sicherheitskräften und zwei der drei Clans in der Region Anizay aufnehmen.</t>", "PLAIN DOWN", 0.8, true, true];
waitUntil { camCommitted _camera; };

_camera camSettarget camTarget_3;
_camera camSetPos [8534.13,4964.83,1];
_camera camCommit 0;
_camera camSetPos [8534.13,4964.83,20];
_camera camCommit 7;
titleText ["<t color='#ffffff' size='2'>Innerhalb der nächsten Stunde gibt es ein Treffen des Anführers der Sicherheitskräfte als auch der Clanführer aus Janur und Murabat.</t>", "PLAIN DOWN", 2, true, true];
waitUntil { camCommitted _camera; };


_camera camSetPos [8344.3,5352.56,50];
_camera camCommit 7;
titleText ["<t color='#ffffff' size='2'>Die Ranger haben den Auftrag, die Clanführer zu dem Treffen zu bringen und für die Sicherheit des Treffens zu sorgen.</t>", "PLAIN DOWN", 2, true, true];
waitUntil { camCommitted _camera; };


_camera camSettarget camTarget_4;
_camera camSetPos [8448.84,6855.83,5];
_camera camCommit 0;
_camera camSettarget camTarget_1;
_camera camSetPos [8448.84,6855.83,20];
_camera camCommit 10;
titleText ["<t color='#ffffff' size='2'>Sobald das Treffen beendet wurde, ziehen die Ranger sich zum Landay Airfield zurück.</t>", "PLAIN DOWN", 2, true, true];
waitUntil { camCommitted _camera; };

_camera camSettarget plane1;
_camera camSetPos [8587.75,6285.67,1];
_camera camCommit 0;
_camera camSettarget camTarget_1;
_camera camSetPos [8600.67,6243.25,10];
_camera camCommit 10;
titleText ["<t color='#ffffff' size='2'>Geplanter Start der Maschine nach Kabul ist um 1900.</t>", "PLAIN DOWN", 2, true, true];
waitUntil { camCommitted _camera; };

_camera camSettarget base;
_camera camSetPos [8443.73,7146.43,5];
_camera camCommit 0;
_camera camSetPos [8443.73,7146.43,50];
_camera camCommit 10;
titleText ["<t color='#ffffff' size='2'>Auftrag:<br/>1. Sicherung um Naudeh<br/>2. Clanführer aus Murabat und Janur zum Treffen eskortieren<br/>3. IDAP bei Hilfsgüterverteilung unterstützen</t>", "PLAIN DOWN", 2, true, true];
waitUntil { camCommitted _camera; };

_camera camSettarget camTarget_5;
_camera camSetPos [8361.45,7119.49,1.5];
_camera camCommit 0;
_camera camSetPos [8361.45,7119.49,5];
_camera camCommit 5;
titleText ["<t color='#ffffff' size='1'>B A L A   M U R G H A B - 01.08.2022 - German Rangers<br/>____________________</t><br/><t color='#ffffff' size='5'>Operation Pullback Pt. 3</t><br/><br/><img image='images\GermanRangersLogo.paa' shadow='0' size='8'/><img image='images\cc_Pics\mesc1.paa' shadow='0' size='8'/>", "PLAIN", 0.8, true, true];
waitUntil { camCommitted _camera; };

//Camera destroying - terminates the 'camera view'
_camera CameraEffect ["Terminate","back"];
CamDestroy _camera;

sleep 4;

//Text Ticker
[[["Anizay, Afghanistan","size = '0.7' font='PuristaBold'"],["","<br/>"],["Landay Airfield","size = '0.7'","#aaaaaa"]],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;	
sleep 6;
private _t = [daytime, "HH:MM"] call BIS_fnc_timeToString;			// time at missionstart as a string
[["Time: "+_t],safeZoneX / 4, safeZoneH / 2,true,"<t font='PuristaBold'>%1</t>",[],{ false },true] spawn BIS_fnc_typeText2;
