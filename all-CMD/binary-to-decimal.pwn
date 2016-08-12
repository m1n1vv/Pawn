CMD:b(playerid, params[])
{
        if (isnull(params))
                return SendClientMessage(playerid, 0xAA3333AA, !"[Подсказка]: /b [двоичный код]");
        
        new
		result = Binary(params);
		
	if (result)
        {
                new
                        string[19];
                        
                format(string, sizeof(string), "Result: %d", result);
                SendClientMessage(playerid, -1, string);
        }
        else 
        {
                SendClientMessage(playerid, -1, !"Error");
        }

        return 1;
}

stock Binary(const sub[])
{
	new
		result;
	    
        for (new i = 0, n = strlen(sub) - 1; i <= n; i++)
        {
                switch (sub[i])
                {
                        case '0', '1':
                        {
                                result += (sub[i] == '1') ? (1 << n - i) : (0);
                        }
                        default:
                        {
                                return 0;
                        }
                }
        }
        return result;
}
