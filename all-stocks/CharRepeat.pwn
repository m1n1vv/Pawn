stock CharRepeat(const string[])
{
	new
		symbol,
		repeat,
		i,
		s;
	
	repeat = symbol = string[0];
	
 	do
	{
		if (symbol == repeat)
		{
			s++;
			if (s == 3)
				return 0;
		}
		repeat = symbol;
	}
	while ((symbol = string[++i]) != '\0');
	return 1;
}
