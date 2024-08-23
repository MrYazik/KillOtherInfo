#pragma semicolon 1
#include <sourcemod>

// System class

void Upper_Case(char[] weapon, int sizeArray)
{
    char lowerCaseEnglish[26] = "abcdefghljklmnopqrstuvwxyz";
    char upperCaseEnglish[26] = "ABCDEFGHLJKLMNOPQRSTUVWXYZ";

    for (int i = 0; i <= sizeArray; i++)
    {       
        for (int p = 0; p < 26; p++)
        {
            if (weapon[i] == lowerCaseEnglish[p])
            {
                weapon[i] = upperCaseEnglish[p];
            }
        }
    }
}

public void OnPluginStart()
{
    HookEvent("player_death", OtherKill, EventHookMode_Pre);
}

public void OtherKill(Event hEvent, const char[] sEvName, bool bDontBroadcast)
{
    int isHeadshot = hEvent.GetBool("headshot");

    int otherID = GetClientOfUserId(hEvent.GetInt("userid")); // Id игрока который был убит
    int attackerID = GetClientOfUserId(hEvent.GetInt("attacker")); // Id игрока который убил

    char weapon[15];
    hEvent.GetString("weapon", weapon, sizeof(weapon));

    Upper_Case(weapon, sizeof(weapon)); // Меняет каждую букву на большую

    switch (isHeadshot)
    {
        case true:
            PrintToChat(attackerID, "Вы убили - \x02%N \x01в голову c \x03%s", otherID, weapon);
        default:
            PrintToChat(attackerID, "Вы убили - \x02%N \x01с \x03%s", otherID, weapon);
    }
}