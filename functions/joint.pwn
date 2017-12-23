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
