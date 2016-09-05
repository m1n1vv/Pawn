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
