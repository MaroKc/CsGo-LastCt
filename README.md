# CsGo-LastCt
Script to CsGo server for JailBreak Mod which notify all player when there is only one CT 


Description :
This script notify all player (with 3 method: ChattMessage, MenuMessagge, CenterMessagge) into the server when are alive last Ct, this plugin is more used in JailBreak server.

Config :

// Enable or disable notify via Admin message
// -
// Default: "1"
sm_LastCt_CenterMessage "1"

// Enable or disable notify via chat message
// -
// Default: "1"
sm_LastCt_ChatMessage "1"

// Enable or disable notify via Menu message
// -
// Default: "1"
sm_LastCt_MenuMessage "1"

// Enable or disable notify via Menu message
// -
// Default: "1"
sm_LastCt_Sound "1"

// Enable or disable if are alive 1 CT
// -
// Default: "1"
sm_lastct "1"

If you want change the music, add you file mp3 into the sound/mis/ folder and rename "lastct.mp3"

How Install :

Replace the folders into the csgo folder of your server :
* Place the lastct.smx in your sourcemod/plugins/ folder.
* Place the lastct.phrase.txt in your sourcemod/translation/ folder.
* Place the lastct.mp3 in your sound/mis/ folder.
