stock bool:strequal(const string1[], string2[], bool:ignorecase = false, length = cellmax)
{
    new
        s1 = string1[0],
        s2 = string2[0];
            
    if ((s1 == '\0' || s2 == '\0') && (s1 != s2))
        return false;
            
    return strcmp(string1, string2, ignorecase, length) == 0;
}
