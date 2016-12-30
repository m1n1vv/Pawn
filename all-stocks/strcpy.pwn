stock strcpy(to[], const from[], pos = 0, maxlength = sizeof to)
	return strins((to[0] = EOS,to), from, pos, maxlength);

stock strcpy(to[], const from[], maxlength = sizeof to)
        return strcat((to[0] = EOS, to), from, maxlength);
