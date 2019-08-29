stock AddDelimiterToInt(value, const space[] = " ")
{
	new
		string[16],
		i,
		k,
		v = 3,
		s;

	format(string, sizeof string, "%i", value >= 0 ? value : -value);

	k = strlen(string);
	i = k/3;
	k %= 3;
	
	if (k != 0)
	{
		strins(string, space, k);
		k++;
	}

	while (--i > 0)
	{
		k += v;
		strins(string, space, k);
		v++;
	}

	if (value < 0)
		strins(string, "-", 0);

	return string;
}
