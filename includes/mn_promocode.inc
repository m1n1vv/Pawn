enum 
 	pc_code
	{
		pc_text[4],
		pc_cash
	};
	
const
	pc_number = 3;

static const
	pc_information[pc_number][pc_code] =
	{
		{!"#kit",		3},
		{!"#hello", 		500000},
		{!"#pawn", 		1000000}
	};

static
	pc_counter;

stock PromoCode(const code[], &cash, booston = 0)
{	
	pc_counter = -1;

	for (new i = 0; i < pc_number; i++)
	{
		if (strequal(code, pc_information[i][pc_text]))
		{
			pc_counter = i;
			break;
		}
	}
	
	if (pc_counter == -1)
		return cash = 0;

	cash = (!booston) ? (pc_information[pc_counter][pc_cash]) : (pc_information[pc_counter][pc_cash]*2);
	
	return 1;
}
