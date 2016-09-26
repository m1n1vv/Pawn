main()
{
	new
		LS = 654,
		LV = 7653,
		SF = 27;

	if (LS < LV)
	{
		if (LS < SF)
		{
			print("LS");
		}
		else
		{
			if (SF < LV)
			{
				print("SF");
			}
			else
			{
				print("LV");
			}
		}
	}
	else
	{
		if (LV < SF)
		{
			print("LV");
		}
	}
}

main()
{
	new
		minimum,
		LS = 500,
		LV = 70,
		SF = 3000;

	if (LS < LV)
	{
                minimum = LS;
	}
	else
	{
	        minimum = LV;
	}
        
	if (SF < minimum)
	{
	        minimum = SF;
	}
        
	printf("%i", minimum);
}
