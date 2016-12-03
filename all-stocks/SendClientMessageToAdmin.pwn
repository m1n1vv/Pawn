stock SendClientMessageToAdmin(level, const str[])
{
	for(new i = 0, j = GetPlayerPoolSize() + 1; i <= j; i++)
        {
                if (pInfo[i][pAdmin] >= level)
                {
        	        SendClientMessage(i, -1б str);
                }
        }
	return 1;
}
