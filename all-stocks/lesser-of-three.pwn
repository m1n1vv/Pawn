stock lesInt(a, b, c)
{
        static
                minimum;
        
        if (a < b)
        {
                minimum = a;
        }
        else
        {
                minimum = b;
        }
        if (c < minimum)
        {
                minimum = c;
        }
        
        return minimum;
}

//for include
stock Float:lesFloat(Float:a, Float:b, Float:c)
{
        static
                Float:minimum;
        
        if (a < b)
        {
                minimum = a;
        }
        else
        {
                minimum = b;
        }
        if (c < minimum)
        {
                minimum = c;
        }
        
        return minimum;
}

//for mod
forward Float:lesFloat(Float:a, Float:b, Float:c);
public Float:lesFloat(Float:a, Float:b, Float:c)
{
        static
                Float:minimum;

        if (a < b)
        {
                minimum = a;
        }
        else
        {
                minimum = b;
        }
        if (c < minimum)
        {
                minimum = c;
        }

        return minimum;
}
