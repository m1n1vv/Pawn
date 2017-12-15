stock Binary(const sub[], &result)
{
	static
		i;

 	for(result = i = 0;;i++)
	{
		switch (sub[i])
		{
			case 49:
			{
				result = result * 2 | 1;
			}
			case 48:
			{
				result *= 2;
			}
			default:
			{
				break;
			}
		}
	}

	return result;
}
