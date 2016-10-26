CMD:lplate(playerid, params[])
{
        extract params -> new string:number[7], region; else
                return SendClientMessage(playerid, -1, !"/lplate [номер] [регион]");

        if (!strval(region) || strval(region) > 99)
                return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Номер региона максимум может состоять из двух цифр");

        if (strlen(number) < 1 || strlen(number) > 6)
                return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Превышено количество символов"); 

    	static const 
    		str[] = "Вы получили номерной знак. Ваш номер %s %d";

        new
                string[sizeof str + 6 + 2 - 2*2],
                i,
                n;

        while ((n = number[i]) != '\0')
        {
                switch(n)
                {
                        case 'А'..'Я', 'A'..'Z':
                        {
                                if (i > 0 || i < 4)
                                        return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Неправильное расположение букв и цифр. Пример: P849CK");
                        }
                        case '0'..'9':
                        {
                                if (i < 1 || i > 3)
                                        return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Неправильное расположение букв и цифр. Пример: P849CK");
                        }
                        default
                        {
                                return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Неправильное расположение букв и цифр. Пример: P849CK");
                        }
                }

                i++;
        }

        pInfo[playerid][pNumber][0] = EOS;
        strins(pInfo[playerid][pNumber], number, 0);
        pInfo[playerid][pRegion] =  region;

        format(string, sizeof string, str, number, region);
        SendClientMessage(playerid, -1, string);

        return 1;
}
