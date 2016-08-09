new
        Float:hp;

GetPlayerHealth(playerid, hp);

if (hp == 100) 
        return 1;

SetPlayerHealth(playerid, hp + (100 - hp));
