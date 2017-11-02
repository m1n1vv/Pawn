#if  defined PROMOCODE
	#endinput
#endif
#define PROMOCODE

enum 
	pc_code
	{
		pc_text[4],
		pc_cash
	};

#if !defined pc_size
	const pc_size = 3;
#endif
	
static const
	pc_information[pc_size][pc_code] =
	{
		{!"#kit",		300000},
		{!"#hello", 		500000},
		{!"#pawn", 		1000000}
	};

static
	pc_counter;

#if !defined strequal
	stock bool:strequal(const string1[], const string2[], bool:ignorecase = false, length = cellmax)
	{
		new
		    s1 = string1[0],
		    s2 = string2[0];
		    
		if ((s1 == '\0' || s2 == '\0') && (s1 != s2))
		    return false;
		    
	    return strcmp(string1, string2, ignorecase, length) == 0;
	}
#endif

stock PromoCode(const code[], &cash, booston = 0)
{	
	pc_counter = -1;

	for (new i = 0; i < pc_size; i++)
	{
		if (strequal(code, pc_information[i][pc_text]))
		{
			pc_counter = i;
			break;
		}
	}
	
	if (pc_counter == -1)
		return cash = 0;

	cash = (!booston) ? (pc_information[pc_counter][pc_cash]) : (pc_information[pc_counter][pc_cash]*booston);
	
	return 1;
}
