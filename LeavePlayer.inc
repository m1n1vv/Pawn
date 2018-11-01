stock LeavePlayer(playerid, const string[])
{
	static
	    	find,
	    	sizeid,
	    	line;
	    
	new
	    	str[50],
	    	str_id[5],
	    	str_1[50],
	    	str_2[50];
	    
	valstr(str_id, playerid);
	sizeid = strlen(str_id);
	line = strlen(string);
	strcat(str, string);
    
	if(strfind(string, str_id, true) != -1)
	{
		find = strfind(string, str_id);

		if (find == 0 || string[find+sizeid] == 0)
		{
			strmid(str_1, string, 0, find);
			strmid(str_2, string, find+sizeid, line);
			strcat(str_1, "-1");
			strcat(str_1, str_2);
	    		return str_1;
		}
		else if (string[find-1] == 32  && string[find+sizeid] == 44)
		{
			strmid(str_1, string, 0, find);
			strmid(str_2, string, find+sizeid, line);
			strcat(str_1, "-1");
			strcat(str_1, str_2);
			return str_1;
		}
		else return str;
	}
	else return str;
}
