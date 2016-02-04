/*
* - CS:GO JailBreak LastCt
* - Author : iTaGhost
* - For  AgrumiBusters Community
* - http://agrumibusters.it
*/

#include <sourcemod>
#include <sdktools>
#include <multicolors>
#include <emitsoundany>

public Plugin:myinfo = 
{
	name 		= "JailBreak LastCt",
	author 		= "iTaGhost",
	description = "Notify all player when there is alive 1 CT",
	version 	= "1.0.0",
	url 		= "http://agrumibusters.it"
}


new Handle:Config_LastCt;
new Handle:Config_LastCt_ChatMessage;
new Handle:Config_LastCt_CenterMessage;
new Handle:Config_LastCt_MenuMessage;
new Handle:Config_LastCt_Sound;


public OnPluginStart()
{
	HookEvent("player_death", player_death);
	
	Config_LastCt = CreateConVar( "sm_LastCt", "1", "Enable or disable if are alive 1 CT");
	Config_LastCt_ChatMessage = CreateConVar( "sm_LastCt_ChatMessage", "1", "Enable or disable notify via chat message");
	Config_LastCt_CenterMessage = CreateConVar( "sm_LastCt_CenterMessage", "1", "Enable or disable notify via Admin message");
	Config_LastCt_MenuMessage = CreateConVar( "sm_LastCt_MenuMessage", "1", "Enable or disable notify via Menu message");
	Config_LastCt_Sound = CreateConVar( "sm_LastCt_Sound", "1", "Enable or disable notify via Menu message");
	
	AutoExecConfig( true, "lastct" );
	
	LoadTranslations("lastct.phrases");
}

public OnMapStart() 
{ 
    AddFileToDownloadsTable("misc/lastct.mp3"); 
    PrecacheSoundAny("misc/lastct.mp3");
} 

public player_death(Handle:event, const String:name[], bool:dontBroadcast)
{
	if (GetConVarInt(Config_LastCt) == 1)	
	{	
		new CT = 0;
	
		for(new tmp = 1; tmp <= MaxClients; tmp++)
		{
			if(IsClientInGame(tmp) && GetClientTeam(tmp) == 3 && IsPlayerAlive(tmp))
			{
				CT++;
			}
		}
 
		if(CT == 1) // One CT left
		{		
			if (GetConVarInt(Config_LastCt_ChatMessage) == 1)
			{
				CPrintToChatAll("%t", "line1");
				CPrintToChatAll("%t", "line2");
				CPrintToChatAll("%t", "line3");
			}
			if (GetConVarInt(Config_LastCt_CenterMessage) == 1)
			{
				ServerCommand("sm_csay %t", "CenterMessagge");
			}
			if (GetConVarInt(Config_LastCt_MenuMessage) == 1)
			{
				ServerCommand("sm_msay %t", "MenuMessagge");
			}
			if (GetConVarInt(Config_LastCt_Sound) == 1)
			{
				EmitSoundToAllAny("misc/lastct.mp3");
			}
		}
	}
}