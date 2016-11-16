stock ceilInt(a, b, c)
{
	static
		minimum;

	minimum = (a < b) ? (a) : ((c < b) ? (c) : (b));

	return minimum;
}

stock Float:ceilFloat(Float:a, Float:b, Float:c)
{
	static
		Float:minimum;

	minimum = (a < b) ? (a) : ((c < b) ? (c) : (b));

	return minimum;
}
