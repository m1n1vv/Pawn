stock GivePlayerMoneyPlus(playerid, amount)
{   
        pInfo[playerid][pMoney] += amount;
        GivePlayerMoney(playerid, amount);
	
	if (GetPlayerMoney(playerid) != pInfo[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pInfo[playerid][pMoney]);
	}
	
        return 1;
}
#if defined _ALS_GivePlayerMoney
    #undef    GivePlayerMoney
#else
    #define    _ALS_GivePlayerMoney
#endif
#define GivePlayerMoney GivePlayerMoneyPlus
