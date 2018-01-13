stock Float:floatformat(Float:value, round)
{
	if (round == 0)
	    return floatround(value)*1.0;
	
	return floatround(value*floatpower(10.0, round))/floatpower(10.0, round)+0.000001;
}
