stock Binary(const sub[], &result)
{
        new
                i = -1,
                n = strlen(sub) - 1,
                c;
        
        while((c = sub[++i]) != '\0')
        {
                switch (c)
                {
                        case '0', '1':
                        {
                                result += (c == '1') ? (1 << n - i) : (0);
                        }
                        default:
                        {
                                return 0;
                        }
                }
        }
    
        return result;
}
