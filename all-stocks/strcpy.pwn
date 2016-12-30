stock strcpy(to[], const from[], pos = 0, maxlength = sizeof to)
	return strins((to[0] = EOS,to), from, pos, maxlength);

stock strcpy(to[], const from[], maxlength = sizeof to)
        return strcat((to[0] = EOS, to), from, maxlength);

stock strncpy(dest[], const source[], count, pos = 0, maxlength = sizeof dest)
        return strmid((dest[0] = EOS, dest), source, pos, count, maxlength);
