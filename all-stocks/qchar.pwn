stock qchar(number)
{
        new
        str[12];

        return valstr(str, number);
}  

stock qchar(number)
{
	new
                str[12];

	if (number >= 0)
		return valstr(str, number);
	else
                return valstr(str, number)-1;
}
