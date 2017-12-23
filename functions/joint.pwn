stock joint(const separator[], ...)
{
	static
		val,
		str[11],
		string[100];

	for(new i = 0, j = numargs(), opt = numargs()-1; ++i != j;)
	{
		val = getarg(i);
		valstr(str, val);
		strcat(string, str);
		if (i != opt)
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
	
	for(new i = 0, s = size - 1; i < size; i++)
	{
		val = value[i];
		valstr(str, val);
		strcat(string, str);
		if (i != s)
			strcat(string, separator);
	}

	return string;
}
