//printf("%i", strnum(17403797));

stock strnum(n)
{
	new
		res;

	while(0 != n)
	{
		n = n/10;
		res++;
	}
	
	return res;
}
