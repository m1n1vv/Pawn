CMD:testslot(playerid)
{
        static const
                Slot_ID[] =
                {
                        0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, -1, -1, -1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
                };
        new
                Player_Slots[13],
                Player_Weapons[13],
                Player_Ammo[13],
                string[10];
        for (new i = 0; i < 13; i++)
        {
                GetPlayerWeaponData(playerid, i, Player_Weapons[i], Player_Ammo[i]);
                Player_Slots[i] = Slot_ID[Player_Weapons[i]];
                format(string, sizeof string, "%d", Player_Slots[i]);
                printf(string);
                if (Player_Slots[i] == 6)
                        return printf("This is the sixth slot");
        }
        return 1;
}
