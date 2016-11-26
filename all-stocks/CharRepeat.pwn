stock CharRepeat(const string[])
{
        new
                symbol,
                repeat,
                i,
                s;

        repeat = string[0];

        while ((symbol = string[++i]) != '\0')
        {
                if (symbol != repeat)
                {
                        s = 0;
                }
                else
                {
                        if (++s == 2)
                                return 0;
                }
                repeat = symbol;
        }
        
        return 1;
}
