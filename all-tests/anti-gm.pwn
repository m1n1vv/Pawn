new
        hack[MAX_PLAYERS char],
        Float:health1[MAX_PLAYERS],
        Float:health2[MAX_PLAYERS];

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
        if(damagedid != INVALID_PLAYER_ID)
        {
                if (hack{playerid} == 0)
                {
                        hack{playerid} = 1;
                        GetPlayerHealth(damagedid, health1[playerid]);
                }
                else if (hack{playerid} == 1)
                {
                        hack{playerid} = 0;
                        GetPlayerHealth(damagedid, health2[playerid]);

                        if (health1[playerid] == health2[playerid])
                                SendClientMessageToAll(-1, !"GM ON");
                        else
                                SendClientMessageToAll(-1, !"GM OFF");
                }
        }
        r
