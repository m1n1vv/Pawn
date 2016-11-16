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
            print("123");
            if (s == 3)
				return 0;
        }
        repeat = symbol;
        printf("1%i", s);
    }
    return 1;
}
