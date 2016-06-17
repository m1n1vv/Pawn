#if !defined DIALOG_WEAPONS_ID
    #define DIALOG_WEAPONS_ID 18498
#endif
static mn_weaponid[MAX_PLAYERS char];
static mn_ammunition[MAX_PLAYERS char];
static mn_price[MAX_PLAYERS];
static weapons[7][2];
static const
    mn_buystat_weap_name[][] =
    {
        "9mm",
        "Silenced 9mm",
        "Desert Eagle",
        "Shotgun",
        "Sawnoff Shotgun",
        "Combat Shotgun",
        "Micro SMG/Uzi",
        "MP5",
        "AK-47",
        "M4",
        "Tec-9",
        "Country Rifle",
        "Sniper Rifle"
    },
    mn_buystat_caliber[][] =
    {
        ".45",
        ".45",
        ".50",
        "12-й",
        "12-й",
        "12-й",
        "9x19 мм Парабеллум",
        "9x19 мм Парабеллум",
        "7,62 мм",
        "5,56x45 мм НАТО",
        "9x19 мм Парабеллум",
        "7,62 мм",
        "7,62 мм"

    },
    mn_buystat_shooting_range[][] =
    {
        "30-35 метров",
        "30-35 метров",
        "30-35 метров",
        "40 метров",
        "30-35 метров",
        "40 метров",
        "30-35 метров",
        "40-45 метров",
        "70 метров",
        "90 метров",
        "30-35 метров",
        "100 метров",
        "100 метров"
    };
    
stock BuyWeapons(playerid, weaponid)
{
    mn_weaponid{playerid} = weaponid; 
    mn_PlayerWeapon(playerid);
    static const str[] = "Оружие: \t\t\t%s\n\nКалибр: \t\t\t%s\nПатронов в обойме: \t\t%i\nДальность стрельбы: \t\t%s\nЦена: \t\t\t\t$%i";
    static string[sizeof str+15+18+2+12+4-(7+6+5+5+6)+1];
    format(string, sizeof string, str, 
        mn_buystat_weap_name[weaponid-22], 
        mn_buystat_caliber[weaponid-22], 
        mn_ammunition{playerid}, 
        mn_buystat_shooting_range[weaponid-22], 
        mn_price[playerid]);
    ShowPlayerDialog(playerid, DIALOG_WEAPONS_ID, DIALOG_STYLE_MSGBOX, "Покупка оружия", string, "Купить", "Закрыть");
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_WEAPONS_ID)
    {
        if(response)
        {
            for(new i = 2; i < 7; i++)
            {
                GetPlayerWeaponData(playerid, i, weapons[i][0], weapons[i][1]);
                if(weapons[i][0] == mn_weaponid{playerid}) return SendClientMessage(playerid, 0xAA3333AA, !"У Вас уже есть это оружие");
            }
            if(GetPlayerMoney(playerid) < mn_price[playerid]) return SendClientMessage(playerid, 0xAA3333AA, !"У Вас недостаточно средств");
            GivePlayerMoney(playerid, -mn_price[playerid]);
            GivePlayerWeapon(playerid, mn_weaponid{playerid}, mn_ammunition{playerid});
            SendClientMessage(playerid, 0x33AA33AA, !"Вы успешно совершили покупку");
            return 1;
        }
        else
        {
            SendClientMessage(playerid, 0xAA3333AA, !"Покупка отклонена");
            return 1;
        }
    }
#if defined mn_bw__OnDialogResponse
    return mn_bw__OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
#endif
}

#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mn_bw__OnDialogResponse
#if defined mn_bw__OnDialogResponse
forward mn_bw__OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

public OnPlayerDisconnect(playerid, reason)
{
    mn_weaponid{playerid} = 0;
    mn_ammunition{playerid} = 0;
    mn_price[playerid] = 0;
#if defined mn_bw__OnPlayerDisconnect
    mn_bw__OnPlayerDisconnect(playerid, reason);
#endif
    return 1;
}

#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect mn_bw__OnPlayerDisconnect
#if defined mn_bw__OnPlayerDisconnect
forward mn_bw__OnPlayerDisconnect(playerid, reason);
#endif

stock mn_PlayerWeapon(playerid)
{
    switch(mn_weaponid{playerid})
    {
        case 22, 23: mn_ammunition{playerid} = 17;
        case 24, 27: mn_ammunition{playerid} = 7;
        case 25, 33, 34: mn_ammunition{playerid} = 1;
        case 26: mn_ammunition{playerid} = 2;
        case 28, 31, 32: mn_ammunition{playerid} = 50;
        case 29, 30: mn_ammunition{playerid} = 30;
    }
    switch(mn_weaponid{playerid})
    {
        case 22: mn_price[playerid] = 1720;
        case 23: mn_price[playerid] = 2135;
        case 24: mn_price[playerid] = 2476;
        case 25: mn_price[playerid] = 1459;
        case 26: mn_price[playerid] = 1928;
        case 27: mn_price[playerid] = 2836;
        case 28: mn_price[playerid] = 1838;
        case 29: mn_price[playerid] = 2382;
        case 30: mn_price[playerid] = 3718;
        case 31: mn_price[playerid] = 3967;
        case 32: mn_price[playerid] = 2593;
        case 33: mn_price[playerid] = 4391;
        case 34: mn_price[playerid] = 5628;
    }
    return 1;
}
