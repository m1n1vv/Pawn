#if  defined MN__BW__INCLUDED
    #endinput
#endif
#define MN__BW__INCLUDED

//Блокировка проверки на замену оружия
//#define BW__KEY__REPEAT   

//Блокировка сброса патронов при покупке       
//#define BW__KEY__RESET_AMMO    

#if !defined MN__BW__MAX_WEAPON_NAME
    #define MN__BW__MAX_WEAPON_NAME             (19)
#endif

#if  !defined MN__BW__DIALOG_WEAPONS_ID
    #define MN__BW__DIALOG_WEAPONS_ID           18498
#endif

#if  !defined MN__BW__DIALOG_PROOFE
    #define MN__BW__DIALOG_PROOFE               MN__BW__DIALOG_WEAPONS_ID+1
#endif

#if  !defined MN__BW__COLOR_RED
    #define MN__BW__COLOR_RED                   0xAA3333AA
#endif

#if  !defined MN__BW__COLOR_GREEN
    #define MN__BW__COLOR_GREEN                 0x33AA33AA
#endif               

static
    mn__weaponid[MAX_PLAYERS char],
    mn__ammunition[MAX_PLAYERS],
    mn__slot[MAX_PLAYERS char],
    mn__price[MAX_PLAYERS],
    mn__new_weapon_name[MN__BW__MAX_WEAPON_NAME];

static const
    mn__str[] =
        "Оружие:\t\t\t%s\n\n\
        Калибр:\t\t\t%s\n\
        Количество патронов:\t\t%i\n\
        Дальность стрельбы:\t\t%i метров\n\
        Цена:\t\t\t\t$%i",
    mn__buystat_caliber[13][] =
    {
        !".45",
        !".45",
        !".50",
        !"12-й",
        !"12-й",
        !"12-й",
        !"9x19 мм Парабеллум",
        !"9x19 мм Парабеллум",
        !"7,62 мм",
        !"5,56x45 мм НАТО",
        !"9x19 мм Парабеллум",
        !"7,62 мм",
        !"7,62 мм"
    },
    mn__buystat_price[] = //Цены на оружие
    {
        1700,   //9mm
        2000,   //Silenced 9mm
        2500,   //Desert Eagle
        1500,   //Shotgun
        1900,   //Sawnoff Shotgun
        2900,   //Combat Shotgun
        1950,   //Micro SMG/Uzi
        2400,   //MP5
        3800,   //AK-47
        4000,   //M4
        2600,   //Tec-9
        5000,   //Country Rifle
        6000    //Sniper Rifle
    },
    mn__buystat_shooting_range[] =
    {
        35, 35, 35, 40, 35, 40, 35, 45, 70, 90, 35, 100, 100
    },
    mn__buystat_ammunition[] =
    {
        17, 17, 7, 1, 2, 7, 50, 30, 30, 50, 50, 1, 1
    },
    mn__weapon_slot_id[] =
    {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6
    };

stock BuyWeapons(playerid, weaponid, ammo = 0, price = 0)
{
    new
        pack[20],
        string[sizeof mn__str + MN__BW__MAX_WEAPON_NAME*2 + 2 + 3 + 4 - (2*5 + 19)];

    mn__weaponid{playerid} = weaponid;
    mn__slot{playerid} = mn__weapon_slot_id[weaponid];

    GetWeaponName(weaponid, mn__new_weapon_name, MN__BW__MAX_WEAPON_NAME);

    weaponid -= 22;
    if (!price) 
        price = mn__buystat_price[weaponid];
    if (!ammo) 
        ammo = mn__buystat_ammunition[weaponid];

    mn__price[playerid] = price;
    mn__ammunition[playerid] = ammo;

    strunpack(pack, mn__buystat_caliber[weaponid]);
    format(string, sizeof string, mn__str, 
        mn__new_weapon_name,
        pack,
        ammo,
        mn__buystat_shooting_range[weaponid],
        price
    );

    return ShowPlayerDialog(playerid, MN__BW__DIALOG_WEAPONS_ID, DIALOG_STYLE_MSGBOX, !"Покупка оружия", string, !"Купить", !"Закрыть");
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == MN__BW__DIALOG_WEAPONS_ID)
    {
        if (!response)
            return SendClientMessage(playerid, MN__BW__COLOR_RED, !"Покупка отклонена");

        #if !defined BW__KEY__REPEAT

        new
            mn__old_weapon_name[MN__BW__MAX_WEAPON_NAME],
            mn_player_slot[7],
            mn__player_weapons[7],
            mn_player_ammo[7];

        GetWeaponName(mn__weaponid{playerid}, mn__new_weapon_name, MN__BW__MAX_WEAPON_NAME);

        for (new i = 2; i < 7; i++)
        {
            GetPlayerWeaponData(playerid, i, mn__player_weapons[i], mn_player_ammo[i]);
            mn_player_slot[i] = mn__weapon_slot_id[mn__player_weapons[i]];

            if (mn__player_weapons[i] == mn__weaponid{playerid} && mn_player_ammo[i] != 0)
                return SendClientMessage(playerid, MN__BW__COLOR_RED, !"У Вас уже есть это оружие");

            if (mn_player_slot[i] == mn__slot{playerid} && mn__player_weapons[i] != mn__weaponid{playerid} && mn_player_ammo[i] != 0)
            {
                GetWeaponName(mn__player_weapons[i], mn__old_weapon_name, sizeof mn__old_weapon_name);

                const
                    RES = 36;

                new
                    str[RES] = !"У Вас уже есть оружие в этом слоте.\nПри подтверждении все патроны старого оружия удалятся.\n\nЗаменить ";
                strcat(str, mn__old_weapon_name);
                strcat(str, !" на ");
                strcat(str, mn__new_weapon_name);
                strcat(str, !"?");

                return ShowPlayerDialog(playerid, MN__BW__DIALOG_PROOFE, DIALOG_STYLE_MSGBOX, !"Внимание!", str, "Да", "Закрыть");
            }
        }

        #endif
        
        return Buy(playerid);
    }
    else if (dialogid == MN__BW__DIALOG_PROOFE)
    {
        if (!response)
            return SendClientMessage(playerid, MN__BW__COLOR_RED, !"Покупка отклонена");
        return Buy(playerid);
    }
#if  defined MN__BW__OnDialogResponse
    MN__BW__OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
#endif
    return 0;
}

static stock Buy(playerid)
{
    if (GetPlayerMoney(playerid) < mn__price[playerid])
        return SendClientMessage(playerid, MN__BW__COLOR_RED, !"У Вас недостаточно средств");

    GivePlayerMoney(playerid, -mn__price[playerid]);
    #if !defined BW__KEY__RESET_AMMO
    GivePlayerWeapon(playerid, mn__weaponid{playerid}, 1);
    SetPlayerAmmo(playerid, mn__weaponid{playerid}, 0);
    #endif
    GivePlayerWeapon(playerid, mn__weaponid{playerid}, mn__ammunition[playerid]);

    return SendClientMessage(playerid, MN__BW__COLOR_GREEN, !"Вы успешно совершили покупку");
}

public OnPlayerDisconnect(playerid, reason)
{
    mn__weaponid{playerid} =
    mn__ammunition[playerid] =
    mn__price[playerid] =
    mn__slot{playerid} = 0;
#if  defined MN__BW__OnPlayerDisconnect
    MN__BW__OnPlayerDisconnect(playerid, reason);
#endif
    return 1;
}

#if  defined _ALS_OnDialogResponse
    #undef OnDialogResponse
#else
    #define _ALS_OnDialogResponse
#endif
#define OnDialogResponse MN__BW__OnDialogResponse
#if  defined MN__BW__OnDialogResponse
    forward MN__BW__OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif

#if  defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect MN__BW__OnPlayerDisconnect
#if  defined MN__BW__OnPlayerDisconnect
    forward MN__BW__OnPlayerDisconnect(playerid, reason);
#endif

/*
by m1n1vv
Version: 0.4.2
*/
