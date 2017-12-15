stock Binary(const sub[], &result)
{
	static
		n,
		i,
		c;

	result = i = 0;
	n = strlen(sub);

	while((c = sub[i++]) != 0)
	{
		switch (c)
		{
			case 48, 49:
			{
				result += (c == 49) ? (1 << n - i) : (0);
			}
			default:
			{
				return 0;
			}
		}
	}

	return result;
}
