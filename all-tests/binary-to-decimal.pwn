main()
{
	static const
		sub[] = "1000101";
	new
		result,
		error;
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
                		error++;
                		break;
            		}
        	}
	}
	if (!error)
	{
		printf("\n\tBinary: %s\n\tResult: %i\n", sub, result);
	}
	else
	{
		printf("\tError\n");
	}
}
