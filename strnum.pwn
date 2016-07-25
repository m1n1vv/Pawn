stock strnum(n)
{
        new
                res;

	while(0 != n)
	{
		n = n/10;
		res++;
	}
	
	return n;
}

/*
CMD:n(playerid, params[])
{
        extract params -> new integer; else
                return SendClientMessage(playerid, -1, !"Использование: /n [любое целое число]");
                
        strnum(strval(integer));

        return 1;
}
*/
