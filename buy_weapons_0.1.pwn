#define MAX_WEAPONS_NAME 20
#define DIALOG_WEAPONS_ID 18498
static mn_weaponid[MAX_PLAYERS char];
static mn_weap_name[MAX_WEAPONS_NAME];
static mn_caliber[MAX_WEAPONS_NAME];
static mn_ammunition[MAX_PLAYERS char];
static mn_shooting_range[MAX_WEAPONS_NAME+10];
static mn_price[MAX_PLAYERS];
stock BuyWeapons(playerid, weaponid)
{
    mn_weaponid{playerid} = weaponid; 
    PlayerWeapon(playerid);
    SendClientMessage(playerid, -1, "1");
    static const str[] = "Оружие: \t\t\t%s\n\nКалибр: \t\t\t%s\nПатронов в обойме: \t\t%i\nДальность стрельбы: \t\t%s\nЦена: \t\t\t\t$%i";
    new string[sizeof str+MAX_WEAPONS_NAME*3+10+2+5-(7+6+5+5+6)];
    format(string, sizeof string, str, mn_weap_name, mn_caliber, mn_ammunition{playerid}, mn_shooting_range, mn_price[playerid]);
    ShowPlayerDialog(playerid, DIALOG_WEAPONS_ID, DIALOG_STYLE_MSGBOX, "Покупка оружия", string, "Купить", "Закрыть");
    return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_WEAPONS_ID)
    {
        if(response)
        {
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
#if defined mn_OnDialogResponse
    return mn_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
#endif
}
#if defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse mn_OnDialogResponse
#if defined mn_OnDialogResponse
forward mn_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif
public OnPlayerDisconnect(playerid, reason)
{
    mn_weaponid{playerid} = 0;
    mn_ammunition{playerid} = 0;
    mn_price[playerid] = 0;
#if defined mn_OnPlayerDisconnect
    mn_OnPlayerDisconnect(playerid, reason);
#endif
    return 1;
}
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect mn_OnPlayerDisconnect
#if defined mn_OnPlayerDisconnect
forward mn_OnPlayerDisconnect(playerid, reason);
#endif
stock PlayerWeapon(playerid)
{
    switch(mn_weaponid{playerid})
    {
        case 22:
        {
            mn_weap_name = "9mm";
            mn_caliber = ".45";
            mn_ammunition{playerid} = 17;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 1720;
        }
        case 23:
        {
            mn_weap_name = "Silenced 9mm";
            mn_caliber = ".45";
            mn_ammunition{playerid} = 17;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 2135;
        }
        case 24:
        {
            mn_weap_name = "Desert Eagle";
            mn_caliber = ".50";
            mn_ammunition{playerid} = 7;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 2476;
        }
        case 25:
        {
            mn_weap_name = "Shotgun";
            mn_caliber = "12-й";
            mn_ammunition{playerid} = 1;
            mn_shooting_range = "40 метров";
            mn_price[playerid] = 1459;
        }
        case 26:
        {
            mn_weap_name = "Sawnoff Shotgun";
            mn_caliber = "12-й";
            mn_ammunition{playerid} = 2;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 1928;
        }
        case 27:
        {
            mn_weap_name = "Combat Shotgun";
            mn_caliber = "12-й";
            mn_ammunition{playerid} = 7;
            mn_shooting_range = "40 метров";
            mn_price[playerid] = 2836;
        }
        case 28:
        {
            mn_weap_name = "Micro SMG/Uzi";
            mn_caliber = "9x19 мм Парабеллум";
            mn_ammunition{playerid} = 50;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 1838;
        }
        case 29:
        {
            mn_weap_name = "MP5";
            mn_caliber = "9x19 мм Парабеллум";
            mn_ammunition{playerid} = 30;
            mn_shooting_range = "40-45 метров";
            mn_price[playerid] = 2382;
        }
        case 30:
        {
            mn_weap_name = "AK-47";
            mn_caliber = "7,62 мм";
            mn_ammunition{playerid} = 30;
            mn_shooting_range = "70 метров";
            mn_price[playerid] = 3718;
        }
        case 31:
        {
            mn_weap_name = "M4";
            mn_caliber = "5,56x45 мм НАТО";
            mn_ammunition{playerid} = 50;
            mn_shooting_range = "90 метров";
            mn_price[playerid] = 3967;
        }
        case 32:
        {
            mn_weap_name = "Tec-9";
            mn_caliber = "9x19 мм Парабеллум";
            mn_ammunition{playerid} = 50;
            mn_shooting_range = "30-35 метров";
            mn_price[playerid] = 2593;
        }
        case 33:
        {
            mn_weap_name = "Country Rifle";
            mn_caliber = "7,62 мм";
            mn_ammunition{playerid} = 1;
            mn_shooting_range = "100 метров";
            mn_price[playerid] = 4391;
        }
        case 34:
        {
            mn_weap_name = "Country Rifle";
            mn_caliber = "7,62 мм";
            mn_ammunition{playerid} = 1;
            mn_shooting_range = "100 метров";
            mn_price[playerid] = 5628;
        }
    }
    return 1;
}
