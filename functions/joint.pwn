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
