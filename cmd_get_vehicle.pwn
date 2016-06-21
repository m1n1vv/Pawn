CMD:getveh(playerid, params[])
{
        if (sscanf(params, !"d", params[0])) 
                return SendClientMessage(playerid, 0xFF4530FF, !"[Подсказка]: /r [Радиус]");
        static const str_y[] = "[Данные получены]... {c8d8e3}В радиусе %i м. обнаружено %i транспортных средств... {48aacb}[Радар]: Транспорт обнаружен";
        static const str_n[] = "[Данные получены]... {c8d8e3}В радиусе %i м. транспортных средств не обнаружено";
        new 
                numberofauto = 0,
                Float:x, 
                Float:y, 
                Float:z,
                string[sizeof str_y+10];
        switch(random(6))
        {
                case 1, 3, 5:
                {
                        for (new i = 1; i <= MAX_VEHICLES; i++)
                        {
                                if (GetVehicleModel(i))
                                {
                                        RemovePlayerMapIcon(playerid, i);
                                        GetVehiclePos(i, x, y, z);
                                        if (IsPlayerInRangeOfPoint(playerid, params[0], x, y, z))
                                        {
                                                numberofauto++;
                                                SetPlayerMapIcon(playerid, i, x, y, z, 55, 0, MAPICON_LOCAL);
                                        }
                                }
                        }
                        if (numberofauto > 0)
                        {
                                format(string, sizeof(string), str_y, params[0], numberofauto);
                                SendClientMessage(playerid, 0x99dd32AA, string);
                        }
                        else 
                        {
                                format(string, sizeof(string), str_n, params[0]);
                                SendClientMessage(playerid, 0x99dd32AA, string);
                        }
                }
                default: SendClientMessage(playerid, 0xFF4530FF, !"Сбой в системе!");
        }
        return 1;
}
