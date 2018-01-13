stock Float:floatroundto(Float:value, round)
{
	if (round == 0)
		return floatround(value)*1.0;
	
	return floatround(value*(10.0*round))/(10.0*round)+0.000001;
}
