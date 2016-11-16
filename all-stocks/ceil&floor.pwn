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

stock floorInt(a, b, c)
{
	static
		maximum;

	minimum = (a > b) ? (a) : ((c > b) ? (c) : (b));

	return maximum;
}

stock Float:floorFloat(Float:a, Float:b, Float:c)
{
	static
		Float:maximum;

	maximum = (a > b) ? (a) : ((c > b) ? (c) : (b));

	return maximum;
}
