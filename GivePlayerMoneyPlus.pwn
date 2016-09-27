stock GivePlayerMoneyPlus(playerid, amount)
{
	static
		AmountPlus[MAX_PLAYERS char];

	if (!AmountPlus{playerid})
	{
		AmountPlus{playerid}++;
		return GivePlayerMoney(playerid, amount);
	}
    
	if (GetPlayerMoney(playerid) != pInfo[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	}
	
        pInfo[playerid][pMoney] += amount;
        GivePlayerMoney(playerid, amount);

        return 1;
}
#if defined _ALS_GivePlayerMoney
    #undef    GivePlayerMoney
#else
    #define    _ALS_GivePlayerMoney
#endif
#define GivePlayerMoney GivePlayerMoneyPlus
