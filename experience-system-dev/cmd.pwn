//GivePlayerExperience
CMD:give(playerid, params[])
{
        if (isnull(params))
                return SendClientMessage(playerid, -1, !"/give [количество опыта]");

        GivePlayerExperience(playerid, strval(params));

        return 1;
}

//GetPlayerExperience
CMD:get(playerid, params[])
{
        if (isnull(params))
                return SendClientMessage(playerid, -1, !"/get [ID игрока]");

        static const
                str[] = "Ваш уровень: %i. %i/%i опыта до следующего.";

        new
                xp,
                lvlxp,
                string[sizeof str + 3 + 11*2 - 2*3];
            
        GetPlayerExperience(playerid, xp, lvlxp);
    
        format(string, sizeof string, str, ex_sys__level{playerid}, xp, lvlxp);
        SendClientMessage(playerid, -1, string);

        return 1;
}

//ResetPlayerExperience
CMD:reset(playerid, params[])
{
        if (isnull(params))
                return SendClientMessage(playerid, -1, !"/reset [ID игрока]");

        ResetPlayerExperience(strval(params));

        return 1;
}
