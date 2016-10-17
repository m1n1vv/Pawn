CMD:todo(playerid, params[])
{
        new
                i,
                str[144],
                res1[30],
                res2[30];

        extract params -> new mode, string:mes[60]; else
                return SendClientMessage(playerid, c_white, !"Используйте /todo [сказать - 1 / крикнуть - 2] [текст *действие]");

        if (strfind(mes, "*", true) != -1)
                return SendClientMessage(playerid, c_white, !"В команде не был найден символ *, используйте его, дабы описать действие");

        while (mes[i] != '*')
                i++;
        
        strmid(res1, mes, 0, i-1);
        strmid(res2, mes, i+1, 60);

        mode -= 1;

        format(str, sizeof str, "%s - %s %s, *%s", res1, (!mode) ? ("сказал") : ("крикнул"), Player[playerid][pName], res2);
        SendClientMessage(playerid, 0xc8d8e3AA, str);

        return 1;
}
