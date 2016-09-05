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
		    55,
		    154,
		    98,
		    71,
		    1
		},
		m = a[0];

        for (new i = 0, n = sizeof a; i < n; i++)
        {
                printf("%i", a[i]);
	    
                if (m > a[i])
                        m = a[i];
        }
        
        printf("Minimum: %i", m);
}

main()
{
        new
		a[3][10] =
		{
		    {67, 432, 456, 42, 5, 90, 77, 19, 69, 41},
		    {91, 65, 41, 65, 38, 41, 56,21, 662, 210},
		    {31, 59, 68, 54, 123, 46, 523, 13, 14, 6}
		},
		m = a[0][0];

        for (new i = 0, n = sizeof a; i < n; i++)
            for (new j = 0; j < 10; j++)
	        {
	                printf("%i", a[i][j]);

	                if (m > a[i][j])
	                        m = a[i][j];
	        }

        printf("Minimum: %i", m);
}
