CMD:binary(playerid, params[])
{
	if (isnull(params))
		return SendClientMessage(playerid, 0xAA3333AA, !"[Подсказка]: /b [двоичный код]");

	static const
		str[] = "Result: %i";

	new
		string[sizeof(str) + 11 - 2],
		result;

	Binary(params, result);
	
	if (!result)
		return SendClientMessage(playerid, -1, !"Error");

	format(string, sizeof(string), str, result);
	SendClientMessage(playerid, -1, string);
    
	return 1;
}
