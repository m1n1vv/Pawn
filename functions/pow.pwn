stock pow(a, n)
{
        if (!n)
                return 1;
                
        new
                b = a;
                
        while (--n != 0)
        {
                b *= a;
        }
        
        return b;
}
