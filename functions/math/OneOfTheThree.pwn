//Int:
stock MinOneOfTheThreeInt(a, b, c)
	return (a < b) ? (a) : ((c < b) ? (c) : (b));

stock MaxOneOfTheThreeInt(a, b, c)
	return (a > b) ? (a) : ((c > b) ? (c) : (b));


//Float:
stock Float:MinOneOfTheThreeFloat(Float:a, Float:b, Float:c)
	return (a < b) ? (a) : ((c < b) ? (c) : (b));

stock Float:MaxOneOfTheThreeFloat(Float:a, Float:b, Float:c)
	return (a > b) ? (a) : ((c > b) ? (c) : (b));
