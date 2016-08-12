main()
{
	//English
	for (new i = 65; i < 65 + 26; i++)
		printf("%c: %i", i, i); //uppercase

	for (new i = 97; i < 97 + 26; i++)
		printf("%c: %i", i, i); //lowercase
	
	//Russian
	for (new i = 704; i < 704 + 32; i++)
		printf("%c: %i", i, i); //uppercase

	for (new i = 736; i < 736 + 32; i++)
		printf("%c: %i", i, i); //lowercase
}
