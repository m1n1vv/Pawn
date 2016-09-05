main()
{
        new
		a[6] =
		{
		    67,
		    91,
		    31,
		    7,
		    15,
		    55
		},
		m = a[0];

        for (new i = 0; i < sizeof a; i++)
        {
                printf("%i", a[i]);
	    
                if (m > a[i])
                        m = a[i];
        }
        
        printf("Minimum: %i", m);
}
