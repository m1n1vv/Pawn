main ()
{
	const
		limit = 10;

	static
        index_i,
        m[limit] = {0, 2, 0, 4, 5, 6, 7, 0, 0, 0};

	for (new i = 0; i <= limit; i++)
    {
		if (i == limit)
            break;

        index_i = i == limit - 1 ? 0 : 1;
		
	if (m[i] == 0)
	{
		m[i] = m[i+index_i];
		m[i+index_i] = 0;
	}
	if (m[i] > 0)
		printf("%i", m[i]);
	}
}
