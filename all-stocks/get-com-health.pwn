stock GetComHealth(playerid)
{
	static
 		Float:m,
		Float:health,
		str[] = "Здоровье пополнилось на %.1f хп";
            
	new
		string[sizeof str + 10];
	GetPlayerHealth(playerid, health);

	if (health == 100)
		return 1;
		
	SetPlayerHealth(playerid, 100);

	m = 100 - health;


	format(string, sizeof string, str, m);
	SendClientMessage(playerid, -1, string);
	
	return 1;
}
