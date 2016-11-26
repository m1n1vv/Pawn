stock Float:DistanceBetweenTwoObjects(obj1, obj2)
{
	new
		x1,	x2,
		y1,	y2,
		z1,	z2;

	GetObjectPos(obj1, x1, y1, z1);
	GetObjectPos(obj2, x2, y2, z2);
	return VectorSize(x1-x2, y1-y2, z1-z2);
}

stock Float:DistanceBetweenTwoDynamicObjects(obj1, obj2)
{
	new
		x1,	x2,
		y1,	y2,
		z1,	z2;

	GetDynamicObjectPos(obj1, x1, y1, z1);
	GetDynamicObjectPos(obj2, x2, y2, z2);
	return VectorSize(x1-x2, y1-y2, z1-z2);
}

