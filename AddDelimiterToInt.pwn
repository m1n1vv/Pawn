stock AddDelimiterToInt(value)
{
	new
		string[16],
		i,
		k,
		v = 3,
		s;

	valstr(string, value >= 0 ? value : -value);

	k = strlen(string);
	i = k/3;
	k %= 3;
	
	if (k != 0)
	{
		strins(string, " ", k);
		k++;
	}

	while (--i > 0)
	{
		k += v;
		strins(string, " ", k);
	}

	if (value < 0)
		strins(string, "-", 0);

	return string;
}
