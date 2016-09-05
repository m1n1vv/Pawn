main()
{
	new
		m,
		a[10];
	    
	for (new i = 0, n = sizeof a; i < n; i++)
	{
		a[i] = random(99)+1;
	    
		printf("%i", a[i]);
	    
		if (m < a[i])
			m = a[i];
	}
	
	printf ("Maximum: %i", m);
}

main()
{
	new
		m,
		a[3][10];

	for (new i = 0, n = sizeof a; i < n; i++)
	    for (new j = 0; j < 10; j++)
		{
			a[i][j] = random(99)+1;

			printf("%i", a[i][j]);

			if (m < a[i][j])
				m = a[i][j];
		}

	printf ("Maximum: %i", m);
}
