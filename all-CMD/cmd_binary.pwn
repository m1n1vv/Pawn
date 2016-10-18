CMD:binary(playerid, params[])
{
	if (isnull(params))
		return SendClientMessage(playerid, 0xAA3333AA, !"[Подсказка]: /b [двоичный код]");

	static const
		str[] = "Result: %i";

	new
		string[sizeof(str) + 11 - 2],
		result = Binary(params);
        
	if (!result)
		return SendClientMessage(playerid, -1, !"Error");

	format(string, sizeof(string), str, result);
	SendClientMessage(playerid, -1, string);
    
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
