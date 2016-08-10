stock GetComHealth(playerid)
{
        static 
                Float:m,
                Float:health;
                
        GetPlayerHealth(playerid, health);
        
        if (health == 100) 
                return 1;
                
        m = 100 - health;
        
        return m;
}
