stock Binary(const sub[], &result)
{
	new
		i,
		n = strlen(sub) - 1,
		c;
	
	while((c = sub[i]) != '\0')
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
		
		i++;
	}
    
	return result;
}
