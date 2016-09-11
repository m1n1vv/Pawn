
// Найти 25% от 120 и прибавить к 1100
stock strperc(percentage, figure)
	return figure * percentage / 100;
/*
* new
* 	num = 1100;
* num = num + strperc(25, 120);
* printf("%i", num);
* - Результат: 1130
*/

// Возведение в степень
stock strdeg(figure, degree)
	return degree -1 << figure;
/*
* printf("%i", strdeg(2, 2));
* - Результат: 4
*/

