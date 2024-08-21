#include <sourcemod>

public void OnPluginStart()
{
    HookEvent("player_death", OtherKill, EventHookMode_Pre);
}

public void OtherKill(Event hEvent, const char[] sEvName, bool bDontBroadcast)
{
    
    int otherID = GetClientOfUserId(hEvent.GetInt("userid")); // Id игрока который был убит
    int attackerID = GetClientOfUserId(hEvent.GetInt("attacker")); // Id игрока который убил
    
    PrintToChat(attackerID, "Вы убили - \x02%N.", otherID);
}