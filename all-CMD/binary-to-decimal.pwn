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
                n = strlen(sub),
                tern,
                result,
                error;
                
        for (new i = 0; i < strlen(sub); i++)
        {
                switch (sub[i])
                {
                        case '0', '1':
                        {
                                n--;
                                tern = (sub[i] == '1') ? (1 << n) : (0);
                                result += tern;
                        }
                        default:
                        {
                                error++;
                                SendClientMessage(playerid, 0xAA3333AA, !"\t\t\tError");
                                break;
                        }
                }
        }
        
        if (!error)
        {
                static const
                        str[] = "\t\t\tResult: %i\n";
                        
                new
                        string[sizeof str+20-5];
                        
                format(string, sizeof string, str, result);
                return SendClientMessage(playerid, 0x33AA33AA, string);
        }
        
        return 1;
}
