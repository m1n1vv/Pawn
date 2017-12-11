stock GetDirectionCompass(Float:angle)
{
	static const
		str[][] =
		{
			"NE", "E", "SE", "S", "SW", "W", "NW", "N"
		};

	static
                diff,
		round,
		multiple,
		result,
		string[4];

	round = floatround(angle);
	multiple = round / 15;
	result = multiple * 15;
	diff = 0;

	if (round - result > 5)
	{
                ++multiple;
                result = multiple * 15;
	}
	
	if (result > 360)
                result -= 360;
	else if (result < 0)
                result += 360;

        if (result <= 5)
                result = 360;
	
	if (result % 45 == 0)
		diff = result / 45;

	if (diff)
                strcat((string[0] = EOS, string), str[diff-1]);
 	else
		valstr(string, result);

	return string;
}
