stock lesInt(a, b, c)
{
	static
		minimum;

	minimum = (a < b) ? (a) : ((c < b) ? (c) : (b));

	return minimum;
}

stock Float:lesFloat(Float:a, Float:b, Float:c)
{
	static
		Float:minimum;

	minimum = (a < b) ? (a) : ((c < b) ? (c) : (b));

	return minimum;
}
