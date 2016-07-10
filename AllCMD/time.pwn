CMD:time(playerid)
{
        new
                string[32],
                Hours,
                Minutes,
                Seconds,
                Day,
                Month,
                Year;

        static const
                Months[][] =
                {
                        "января",
                        "февраля",
                        "марта",
                        "апреля",
                        "мая",
                        "июня",
                        "июля",
                        "августа",
                        "сентября",
                        "октября",
                        "ноября",
                        "декабря"
                };

        gettime(Hours, Minutes, Seconds);
        getdate(Year, Month, Day);

        format(string, sizeof(string), "%d:%d:%d, %d %s %d года",
                Hours,
                Minutes,
                Seconds,
                Day,
                Months[Month-1],
                Year
        );
        
        SendClientMessage(playerid, 0x33AAFFFF, string);
        
        return 1;
}
