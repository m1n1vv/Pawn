stock CharRepeat(const string[])
{
        new
                symbol,
                repeat,
                i = -1,
                s;

        repeat = string[0];

        while ((symbol = string[++i]) != '\0')
        {
                if (symbol == repeat)
                {
                        s++;
                        if (s == 3)
                                return 0;
                }
                repeat = symbol;
        }
        return 1;
}
