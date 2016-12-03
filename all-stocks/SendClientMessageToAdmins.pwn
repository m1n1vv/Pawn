stock SendClientMessageToAdmins(level, color, const str[])
{
	for(new i = 0, j = GetPlayerPoolSize() + 1; i <= j; i++)
        {
		if (!IsPlayerConnected(i))
			continue;
			
                if (pInfo[i][pAdmin] >= level)
                {
                        SendClientMessage(i, color, str);
                }
        }
        return 1;
}
