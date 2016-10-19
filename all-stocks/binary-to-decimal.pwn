stock Binary(const sub[], &result)
{
	for (new i = 0, n = strlen(sub) - 1; i <= n; i++)
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
	}
    
	return result;
}  
