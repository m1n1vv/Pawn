stock strcpy(dest[], const source[], pos = 0, maxlength = sizeof dest)
	return strins((dest[0] = EOS, dest), source, pos, maxlength);

stock strcpy(dest[], const source[], maxlength = sizeof dest)
        return strcat((dest[0] = EOS, dest), source, maxlength);

stock strncpy(dest[], const source[], count, pos = 0, maxlength = sizeof dest)
        return strmid((dest[0] = EOS, dest), source, pos, count, maxlength);
