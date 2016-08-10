stock GetComHealth(playerid, &Float:m)
{
        static 
                Float:health;
                
        GetPlayerHealth(playerid, health);
        
        if (health == 100) 
                return 1;
                
        m = 100 - health;
        
        return m;
}
