CMD:saveh(playerid, params[])
{
        extract params -> new Float:radius; else
                return SendClientMessage(playerid, 0xFF4530FF, !"[Подсказка]: /r [Радиус]");

        static const
                time[] = "[%i:%i:%i - %i.%i.%i]\r\n",
                str[] = "CreateVehicle(%i, %.6f, %.6f, %.6f, %.6f, -1, -1, 60); //%i\r\n",
                str_res[] = "В радиусе %.0f м. сохранено %i тс";

        new
                File:file = fopen(!"saveh.txt", io_append),

                Float:x,
                Float:y,
                Float:z,
                Float:a,
        
                Hours,
                Minutes,
                Seconds,
                Day,
                Month,
                Year,

                numberofauto,

                string[sizeof str + 4 + 11*5 + 4 - (2 + 4*4 + 2 + 2)];
        
        gettime(Hours, Minutes, Seconds);
        getdate(Year, Month, Day);

        format(string, sizeof(string), time, Hours, Minutes, Seconds, Day, Month, Year);

        fwrite(file, string);

        for (new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
        {
                GetVehiclePos(i, x, y, z);
                GetVehicleZAngle(i, a);

                if (GetPlayerDistanceFromPoint(playerid, x, y, z) <= radius)
                {
                        numberofauto ++;
                        format(string, sizeof(string), str, GetVehicleModel(i), x, y, z, a, numberofauto);
                        fwrite(file, string);
                }
        }
    
        fclose(file);

        SendClientMessage(playerid, 0x99FF00AA, !"Готово");
        format(string, sizeof(string), str_res, radius, numberofauto);
        SendClientMessage(playerid, 0xc8d8e3AA, string);

        return 1;
}
