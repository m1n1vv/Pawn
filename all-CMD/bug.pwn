CMD:bug(playerid, params[])
{
        extract params -> new string:dis[50], string:link[50]; else 
                return SendClientMessage(playerid, -1, !"Используйте: /bug [описание]|[как с вами можно связаться(ссылка/скайп)]");

        if (sizeof(dis) <= strlen(dis) < 1)
                return SendClientMessage(playerid, -1, !"Описание имеет менее 1 или более 50 символов");

        if (sizeof(link) <= strlen(link) < 1)
                return SendClientMessage(playerid, -1, !"Метод связи имеет менее 1 или более 50 символов");

        static const
                str_q[] = "INSERT INTO `bug` (`name`, `description`, `link`) VALUES ('%s', '%s', '%s')";

        new 
                query[sizeof str_q + MAX_PLAYER_NAME + sizeof(dis)*2 - 2*3], 
                str_m[16] = !"Спасибо, ";

        format(query, sizeof query, str_q, 
                PlayerInfo[playerid][pName], 
                dis, 
                link
        );
        mysql_function_query(mysql_connect_ID, query, false, "", "");

        strcat(str_m, PlayerInfo[playerid][pName]);
        strcat(str_m, !", за оказанную помощь серверу");
        SendClientMessage(playerid, -1, str_m);

        SendClientMessage(playerid, -1, !"Администратор обязательно рассмотрит Вашу запись в багрепорте и свяжется с вами указанным Вами способом");
        SendClientMessage(playerid, -1, !"В случае \"хулиганства\" вы будете наказаны, в случае хорошего репорта - награждены");

        return 1;
}
