stock joint(const separator[], ...)
{
	static
		val,
		str_val[11],
		str_cat[100];

	for(new i = 0, j = numargs(), opt = numargs()-1; ++i != j;)
	{
		val = getarg(i);
		valstr(str_val, val);
		strcat(str_cat, str_val);
		if (i != opt)
			strcat(str_cat, separator);
	}
	
	return str_cat;
}
