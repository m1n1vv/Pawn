CMD:money(playerid,params[])
{
        if(Player[playerid][pAdmin] < 10)
                return SendClientMessage(playerid, -1, !"ВЫ не уполномочены использовать эту команду")

        extract params -> new id, sum; else 
                return SendClientMessage(playerid, -1, !"Подсказка /money [ID игрока] [сумма]");

        static const
                str[] = "Игрок %s получил %i денег";

        new 
                playername[MAX_PLAYER_NAME],
                string[sizeof(str)+MAX_PLAYER_NAME+11-2*2];

        GivePlayerMoney(id, sum);

        GetPlayerName(id, playername, sizeof(playername));

        format(string,sizeof(string), str, playername, sum);
        SendClientMessageToAll(COLOR_RED, string);

        return 1;
}
