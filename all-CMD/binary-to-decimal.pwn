CMD:b(playerid, params[])
{
        if (isnull(params))
                return SendClientMessage(playerid, 0xAA3333AA, !"[Подсказка]: /b [двоичный код]");
                
        Notation(playerid, params[0]);
        
        return 1;
}

stock Notation(playerid, sub[])
{
        new
                result;
                
        for (new i = 0, n = strlen(sub) - 1; i <= n; i++)
        {
                switch (sub[i])
                {
                        case '0', '1':
                        {
                                result += (sub[i] == '1') ? (1 << n - i) : (0);
                        }
                                
                        default:
                        {
                                return SendClientMessage(playerid, 0xAA3333AA, !"\t\t\tError");
                        }
                }
        }
        
        static const
                str[] = "\t\t\tResult: %i";
                        
        new
                string[sizeof str+20-5];
                        
        format(string, sizeof string, str, result);
        SendClientMessage(playerid, 0x33AA33AA, string);
        
        return 1;
}
