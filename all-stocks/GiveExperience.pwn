stock GiveExperience(playerid, score)
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
