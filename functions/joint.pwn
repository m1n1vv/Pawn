stock joint(const separator[], ...)
{
	static
		i,
		value,
		opt,
		num,
		str[11],
		string[100];

	num = numargs();
	opt = num - 1;
	i = 0;
	string[0] = EOS;

	while(++i != num)
	{
		value = getarg(i);
		valstr(str, value);
		strcat(string, str);
		if (i == opt)
			break;
		strcat(string, separator);
	}

	return string;
}


stock jointarray(const separator[], const value[])
{
	static
		size,
		val,
		str[11],
		string[100];

	
	size = strlen(value);
	
	for (new i = 0, opt = size - 1; i < size; i++)
	{
		val = value[i];
		valstr(str, val);
		strcat(string, str);
		if (i != opt)
			strcat(string, separator);
	}

	return string;
}
