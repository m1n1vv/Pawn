stock GetComHealth(playerid, &Float:health, &Float:m)
{
        GetPlayerHealth(playerid, health);
        
        if (health == 100) 
                return 1;
                
        m = 100 - health;
        
        return m;
}
