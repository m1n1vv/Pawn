stock Float:floatformat(Float:value, round)
	return floatround(value*(1.0*round))/(1.0*round)+0.000001;
