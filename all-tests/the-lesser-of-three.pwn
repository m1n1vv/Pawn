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
			if(SF < LV)
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
