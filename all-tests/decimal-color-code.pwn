main()
{
	static const
		sub[] = "2F3519";

	new
                i,
                n = 5,
		c,
		result;

	while((c = sub[i]) != '\0')
	{
		switch(c)
		{
			case '0': c = 0;
			case '1': c = 1;
			case '2': c = 2;
			case '3': c = 3;
			case '4': c = 4;
			case '5': c = 5;
			case '6': c = 6;
			case '7': c = 7;
			case '8': c = 8;
			case '9': c = 9;
			case 'a', 'A': c = 10;
			case 'b', 'B': c = 11;
			case 'c', 'C': c = 12;
			case 'd', 'D': c = 13;
			case 'e', 'E': c = 14;
			case 'f', 'F': c = 15;
 			default:
				return print("Error");
		}

                i++;
		result += pow(16, n--)*c;
	}
	
	printf("%i", result);
	
	return 0;
}

stock pow(a, n)
{
        if (!n)
                return 1;
                
        new
                b = a;
                
        while(--n != 0)
        {
                b *= a;
        }
        
        return b;
}
