stock Captcha()
{
	static
		rand,
		string[6];
	for (new i = 0; i < 5; i++)
	{
		rand = random(2);

		if (rand == 1)
			rand = random(10)+48;
		else
			rand = random(26)+97;

		format(string, sizeof string, "%s%c", string, rand);
	}

	return string;
}
