main()
{
        new
                a,
                b;
                
        a = b = 3;

        printf("a = %i\nb = %i", a, b);

        switch (a || b)
        {
                case 3:
                        print("a или b равно трем");
                default:
                        print("Иди учи switch");
        }

        switch (a && b)
        {
                case 3:
                        print("a и b равны трем");
                default:
                        print("Иди учи switch");
        }
}
