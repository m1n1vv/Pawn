stock AddDelimiterToInt(value)
{
	new
		string[20],
		i,
		k,
		d,
		v = 3,
		s;

	valstr(string, value >= 0 ? value : -value);

	k = strlen(string)%3;
	d = strlen(string)/3;

	if (k != 0)
	{
		strins(string, " ", k);
		k++;
	}

	while (++i < d)
	{
		k += v;
		strins(string, " ", k);
		v++;
	}

	if (value < 0)
		strins(string, "-", 0);

	return string;
}

stock AddDelimiterToInt(value)
{
	new
		string[20],
		i = -1,
		v,
		k,
		s;

	valstr(string, value >= 0 ? value : -value);

	k = strlen(string)%3;

	if (k != 0)
	{
		strins(string, " ", k);
		i += k+1;
	}

	while ((s = string[++i]) != '\0')
	{
		if (++v == 4)
		{
			strins(string, " ", i);
			v = 0;
		}
	}
	
	if (value < 0)
		strins(string, "-", 0);
	
	return string;
}
