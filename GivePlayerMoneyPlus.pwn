stock GivePlayerMoneyPlus(playerid, amount)
{
	#define MoneyPlus   pInfo[playerid][pMoney]

	static
		AmountPlus[MAX_PLAYERS char];

	if (!AmountPlus{playerid})
	{
		AmountPlus++;
		return GivePlayerMoney(playerid, amount);
	}
    
	if (GetPlayerMoney(playerid) != MoneyPlus)
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, MoneyPlus);
	}
        MoneyPlus += amount;
        GivePlayerMoney(playerid, amount);

	#undef admin_lvl

        return 1;
}
#if defined _ALS_GivePlayerMoney
    #undef    GivePlayerMoney
#else
    #define    _ALS_GivePlayerMoney
#endif
#define GivePlayerMoney GivePlayerMoneyPlus
