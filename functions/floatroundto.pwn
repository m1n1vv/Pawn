stock Float:floatroundto(Float:value, round)
	return floatround(value*floatpower(10.0, round))/floatpower(10.0, round)+0.000001;
