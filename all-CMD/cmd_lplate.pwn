CMD:lplate(playerid, params[])
{
        extract params -> new string:number[7], region; else
                return SendClientMessage(playerid, -1, !"/lplate [номер] [регион]");

        if (region > 99)
                return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Номер региона максимум может состоять из двух цифр");

        if (strlen(number) < 1 || strlen(number) > 6)
                return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Превышено количество символов"); 

    	static const 
    		str[] = "Вы получили номерной знак: %s %d";

        new
                string[sizeof str + 6 + 2 - 2*2],
                i,
                n;

        if (!strval(number[1]) || !strval(number[2]) || !strval(number[3]))
		    return print("Îøèáêà1");
        while ((n = number[i]) != '\0')
        {
                switch(n)
                {
                        case '0'..'9', 'А'..'Я', 'A'..'Z':
                        {
                                i++;
                        }
                        default:
                        {
                            	return SendClientMessage(playerid, -1, !"Вы неправильно указали номер. Неправильное расположение букв и цифр. Пример: P849CK");
                        }
                }
        }

        pInfo[playerid][pNumber][0] = EOS;
        strins(pInfo[playerid][pNumber], number, 0);
        pInfo[playerid][pRegion] =  region;

        format(string, sizeof string, str, number, region);
        SendClientMessage(playerid, -1, string);

        return 1;
}
