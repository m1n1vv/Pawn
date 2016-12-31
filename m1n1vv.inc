//Перевод числа с двоичной в десятичную систему счисления
stock Binary(const sub[], &result)
{
	new
		i = -1,
		n = strlen(sub) - 1,
		c;
        
	while ((c = sub[++i]) != '\0')
	{
		switch (c)
		{
			case '0', '1':
			{
				result += (c == '1') ? (1 << n - i) : (0);
			}
			default:
			{
				return 0;
			}
		}
	}
	return result;
}

//Поиск трех одинаковых символов подряд
stock CharRepeat(const string[])
{
        new
                symbol,
                repeat,
                i,
                s;

        repeat = string[0];

        while ((symbol = string[++i]) != '\0')
        {
                if (symbol != repeat)
                {
                        s = 0;
                }
                else
                {
                        if (++s == 2)
                                return 0;
                }
                repeat = symbol;
        }
        
        return 1;
}

//Возведение числа в степень
stock pow(a, n)
{
	if (!n)
		return 1;
                
	new
		b = a;
                
	while (--n != 0)
	{
		b *= a;
	}
        
	return b;
}

//Поиск минимального или максимального числа из трех
stock MinOneOfTheThreeInt(a, b, c)
	return (a < b) ? (a) : ((c < b) ? (c) : (b));

stock MaxOneOfTheThreeInt(a, b, c)
	return (a > b) ? (a) : ((c > b) ? (c) : (b));

stock Float:MinOneOfTheThreeFloat(Float:a, Float:b, Float:c)
	return (a < b) ? (a) : ((c < b) ? (c) : (b));

stock Float:MaxOneOfTheThreeFloat(Float:a, Float:b, Float:c)
	return (a > b) ? (a) : ((c > b) ? (c) : (b));

//Копирование строки
stock strcpy(dest[], const source[], maxlength = sizeof dest)
        return strcat((dest[0] = EOS, dest), source, maxlength);

stock strncpy(dest[], const source[], count, pos = 0, maxlength = sizeof dest)
        return strmid((dest[0] = EOS, dest), source, pos, count, maxlength);
