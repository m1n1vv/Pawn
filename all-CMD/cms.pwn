CMD:pawn(playerid, params[])
{
        extract params -> new radius; else
                return SendClientMessage(playerid, 0xb93232AA, !"[Подсказка]: /pawn [радиус]");

        static const
                str[] = "CreateVehicle(%d, %f, %f, %f, %f, -1, -1, 60); //%d\r\n",
                str_res[] = "Готово. В радиусе %d м. сохранено %d авто";

        new
                File:file = fopen(!"cms_pawn.txt", io_append),
                string[93],
                info[sizeof str_res+5+4-2*2],
                vehicles;

        for (new i = 1; i <= MAX_VEHICLES; i++)
        {
                if (GetVehicleModel(i))
                {
                        new
                                Float:x,
                                Float:z,
                                Float:y,
                                Float:a;

                        GetVehiclePos(i, x, y, z);
                        GetVehicleZAngle(i, a);

                        if (IsPlayerInRangeOfPoint(playerid, radius, x, y, z))
                        {
                                vehicles++;
                                format(string, sizeof string, str, GetVehicleModel(i), x, y, z, a, vehicles);
                                fwrite(file, string);
                        }
                }
        }

        format(info, sizeof info, str_res, radius, vehicles);
        SendClientMessage(playerid, 0x99FF00AA, info);
        
        fclose(file);
        
        return 1;
}
