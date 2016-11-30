CMD:maxval(playerid, params[])
{
	new
                maxx,
		num[10],
                tmp[20],
		idx;

	for (new i = 0; i < 10; i++)
	{
                tmp = strcharsplit(params, idx);
                num[i] = strval(tmp);
		if (maxx < num[i])
			maxx = num[i];
	}
	
	printf("%i", maxx);
	return 1;
}

stock strcharsplit(const string[], &index, seperator=' ')
{
	new result[20], i = 0;
	if (index != 0 && string[index] != '\0') index++;
	while (string[index] && string[index] != seperator && string[index] != '\r' && string[index] != '\n')
	{
		result[i++] = string[index++];
	}
	return result;
}
