stock NotReklama(playerid, string[]) 
{
	static
		c,
		i,
		num1;

	while ((c = string[++i]) != '\0')
	{
		switch(c)
		{
			case '0'..'9': num++;
		}
	}

	if (num > 7)
		return 1;

	c = i = num = 0;

	return 0;
}

/**/
if (NotReklama(playerid, "127.0.0.1:7777") == 1)
	return SendClientMessage(playerid, -1, "Предупреждение! Вы рекламируете сервер!");
/**/
