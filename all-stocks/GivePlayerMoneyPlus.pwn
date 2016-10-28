stock GivePlayerMoneyPlus(playerid, &money, gmoney)
{
    money += gmoney;
    ResetPlayerMoney(playerid);
    return GivePlayerMoney(playerid, money);
}
#if defined _ALS_GivePlayerMoney
    #undef    GivePlayerMoney
#else
    #define    _ALS_GivePlayerMoney
#endif
#define    GivePlayerMoney        GivePlayerMoneyPlus
