stock Captcha()
{
	static
		rand,
		string[6];

	for (new i = 0; i < 5; i++)
	{
		rand = random(10);

		if (rand % 2 == 0)
			rand = random(10)+48;
		else
			rand = random(26)+97;

		format(string, sizeof string, "%s%c", string, rand);
	}

	return string;
}

stock GenerateCaptcha(string[])
{
    static
        i;
    while (i < 5)
        string[i++] = random(2) ? random(10)+48 : random(26)+97;
    i = 0;
    return 1;
}  
