new
        hack[MAX_PLAYERS char],
        Float:health1[MAX_PLAYERS],
        Float:health2[MAX_PLAYERS];

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
        if (damagedid != INVALID_PLAYER_ID)
        {
                if (hack{damagedid} == 0)
                {
                        hack{damagedid} = 1;

                        GetPlayerHealth(damagedid, health1[damagedid]);
                }
                else if (hack{damagedid} == 1)
                {
                        hack{damagedid} = 0;

                        GetPlayerHealth(damagedid, health2[damagedid]);

                        if (health1[damagedid] != health2[damagedid])
                                return 1;

                        new
                                str[19] = !"Игрок {ff0000}";
                        strcat(str, pInfo[damagedid][pName]);
                        strcat(str, !" {ffffff}исключен за использование GM");
                        SendClientMessageToAll(-1, str);

                        return Kick(damagedid);
                }
        }
        return 1;
}

//Test
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
        if (damagedid != INVALID_PLAYER_ID)
        {
                if (hack{damagedid} == 0)
                {
                        hack{damagedid} = 1;
                        
                        GetPlayerHealth(damagedid, health1[damagedid]);
                }
                else if (hack{damagedid} == 1)
                {
                        hack{damagedid} = 0;
                        
                        GetPlayerHealth(damagedid, health2[damagedid]);

                        if (health1[damagedid] == health2[damagedid])
                                SendClientMessageToAll(-1, !"GM ON");
                        else
                                SendClientMessageToAll(-1, !"GM OFF");
                }
        }
        return 1;
}
