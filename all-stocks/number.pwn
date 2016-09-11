
// Найти 25% от 120 и прибавить к 1100
stock strperc(percentage, number)
	return number * percentage / 100;
/*
* printf("%i", 1100 + strperc(25, 120)); // Результат: 1130
*/

// Возведение в степень
stock strdeg(number, degree)
	return degree - 1 << number;
/*
* printf("%i", strdeg(2, 2)); // Результат: 4
*/

