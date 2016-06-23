new pickup;

public OnGameModeInit()
{
        pickup = CreatePickup(1242, 2, 1503.3359, 1432.3585, 10.1191, -1);
        return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
        if (pickupid == pickup)
        {
                ShowPlayerDialog(playerid, 68, DIALOG_STYLE_LIST, !"Покупка оружия", !"Silenced 9mm\nCombat Shotgun\nMicro SMG/Uz\nM4\nSniper Rifle", !"Купить", !"Отмена");
        }
        return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
        switch(dialogid)
        {
                case 68:
                {
                        switch(listitem)
                        {
                                case 0: BuyWeapons(playerid, 23); //Silenced 9mm
                                case 1: BuyWeapons(playerid, 27); //Combat Shotgun
                                case 2: BuyWeapons(playerid, 28); //Micro SMG/Uz
                                case 3: BuyWeapons(playerid, 31); //M4
                                case 4: BuyWeapons(playerid, 34); //Sniper Rifle
                        }
                }
        }
        return 0;
}
