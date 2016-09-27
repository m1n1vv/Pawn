stock GivePlayerMoneyPlus(playerid, amount)
{
        #define MoneyPlus   pInfo[playerid][pMoney]
    
        if (GetPlayerMoney(playerid) != MoneyPlus)
        {
                ResetPlayerMoney(playerid);
                GivePlayerMoney(playerid, MoneyPlus);
        }
        
        MoneyPlus += amount;
        GivePlayerMoney(playerid, amount);

        #undef MoneyPlus

        return 1;
}
#if defined _ALS_GivePlayerMoney
    #undef    GivePlayerMoney
#else
    #define    _ALS_GivePlayerMoney
#endif
#define GivePlayerMoney GivePlayerMoneyPlus
