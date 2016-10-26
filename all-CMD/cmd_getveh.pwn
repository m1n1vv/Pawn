CMD:getveh(playerid, params[])
{
        extract params -> new Float:radius; else
                return SendClientMessage(playerid, 0xFF4530FF, !"[Подсказка]: /getveh [Радиус]");

        static const
                str_y[] = "В радиусе %.0f м. обнаружено %i тс...",
                str_n[] = "В радиусе %.0f м. транспортных средств не обнаружено";

        new
                Float:x,
                Float:y,
                Float:z,

                rand = random(2),
                numberofauto,

                string[sizeof str_n];

        if (radius > 1000.0)
                return SendClientMessage(playerid, 0xFF4530FF, !"Максимальное расстояние 1000 метров");

        if (!rand)
                return SendClientMessage(playerid, 0xFF4530FF, !"Сбой в системе!");
    
        for (new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
        {
                GetVehiclePos(i, x, y, z);
                RemovePlayerMapIcon(playerid, i);

                if (GetPlayerDistanceFromPoint(playerid, x, y, z) <= radius)
                {
                        numberofauto ++;
                        SetPlayerMapIcon(playerid, i, x, y, z, 55, 0, MAPICON_LOCAL);
                }
        }

        if (numberofauto)
        {
                SendClientMessage(playerid, 0x99dd32AA, !"[Данные получены]...");
                format(string, sizeof(string), str_y, radius, numberofauto);
                SendClientMessage(playerid, 0xc8d8e3AA, string);
                SendClientMessage(playerid, 0x48aacbAA, !"[Радар]: Транспорт обозначен");
        }
        else
        {
                SendClientMessage(playerid, 0x99dd32AA, !"[Данные получены]...");
                format(string, sizeof(string), str_n, radius);
                SendClientMessage(playerid, 0xc8d8e3AA, string);
        }
        
        return 1;
}
