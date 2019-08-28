stock AddDelimiterToInt(value)
{
	new
		string[16],
		i,
		k,
		v = 3,
		s;

	valstr(string, value >= 0 ? value : -value);

	k = strlen(string)%3;
	i = strlen(string)/3;
	
	if (k != 0)
	{
		strins(string, " ", k);
		k++;
	}

	while (--i > 0)
	{
		k += v;
		strins(string, " ", k);
		v++;
	}

	if (value < 0)
		strins(string, "-", 0);

	return string;
}
