stock GivePlayerExperience(playerid, score)
{
    static const
        str[] =
        {
            100, 
            250,
            500,
            1000
        };

    score = pInfo[playerid][pXP] += score;

    while (score > str[pInfo[playerid][pLvl]])
    {
        pInfo[playerid][pLvl]++;
    }

    return 1;
}  

stock GetPlayerExperience(playerid)
{
	static const
	    str[] = "Ваш уровень: %i. %i/%i опыта до следующего.",
	    lvl[] =
	    {
	        100,
	        250,
	        500,
	        1000
	    };

	new
	    getLvl = pInfo[playerid][pLvl],
	    getXP = pInfo[playerid][pXP],
	    string[sizeof str + 3 + 11*2 - 2*3];


	format(string, sizeof string, str,
	    getLvl,
	    getXP-lvl[getLvl-1],
	    lvl[getLvl]-lvl[getLvl-1]
	);

	return string;
}

stock ResetPlayerExperience(playerid, score)
{
	if (score == 0)
		return pInfo[playerid][pLvl] = pInfo[playerid][pXP] = 0;

	score = pInfo[playerid][pLvl] -= score;

	while (score < str[pInfo[playerid][pLvl]])
    {
        pInfo[playerid][pLvl]--;
    }

	return 1;
}
