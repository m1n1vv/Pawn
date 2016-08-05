CMD:leaders(playerid)
{
        static const
                str[] = "%s - %s[%d]",
                str_l[] = "В сети всего %d лидеров",
                ttext[][] =
                {
                        "{2641FE}LSPD",
                        "{313131}FBI",
                        "{33AA33}Армия: Авианосец",
                        "{A52A2A}МЧС",
                        "{DDA701}LCN",
                        "{FF0000}Yakuza",
                        "{114D71}Мэрия",
                        "{B313E7}Casino Rich",
                        "{2641FE}SFPD",
                        "{139BEC}Инструкторы",
                        "{8813E7}The Ballas",
                        "{DBD604}The Vagos",
                        "{B4B5B7}Русская мафия",
                        "{009F00}The Grove",
                        "{40848B}San News",
                        "{01FCFF}The Aztecas",
                        "{83BFBF}The Rifa",
                        "{33AA33}Армия: Зона 51",
                        "{2641FE}LVPD",
                        "{708090}Хитман",
                        "{F45000}Street Rasers",
                        "{2E8B57}SWAT",
                        "{708090}Правительство",
                        "{B313E7}Casino Rich",
                        "{FF0000}Неизвестно"
                };

        new 
                string[sizeof str + 24 + MAX_PLAYER_NAME + 4 - 2*3],
                b;

        for(new i = 0, j = GetPlayerPoolSize()+1; i <= j; i++)
        {
                if (Player[i][pAdmin] > 0) 
                        continue;

                if (Player[i][pLeader] > 0)
                {
                        b++;
                        format(string, sizeof string, str, ttext[Player[i][pLeader]-1], Player[i][pNames], i);
                        SendClientMessage(playerid, -1, string);
                }
        }

        if (b > 0)
        {
                format(string, sizeof string, str_l, b);
                SendClientMessage(playerid, -1, string);
        }
        else 
                return SendClientMessage(playerid, COLOR_GREY, !"Нету ни кого из лидеров в сети.");

        return 1;
}
