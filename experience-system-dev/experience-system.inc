/*****************************************
* Experience System 0.1
* by m1n1vv
*****************************************/

#if  defined MN__EXPERIENCE_SYSTEM__INCLUDED
        #endinput
#endif 
#define MN__EXPERIENCE_SYSTEM__INCLUDED											

new
	ex_sys__level[MAX_PLAYERS char],
	ex_sys__experience[MAX_PLAYERS];

static const
	ex_sys__str[] = "Ваш уровень: %i. %i/%i опыта до следующего.",
	ex_sys__scores[] =
	{
		0,
		100,
		250,
		500,
		1000,
		2000
	};

stock GivePlayerExperience(playerid, score)
{
	if (!score)
		return 1;

	if (ex_sys__experience[playerid] - score < 1)
		return ex_sys__experience[playerid] += score;

	ex_sys__experience[playerid] += score;

	if (score)
	{
		while (ex_sys__experience[playerid] > ex_sys__scores[ex_sys__level{playerid} + 1])
		{
			ex_sys__level{playerid}++;
		}
	}
	else
	{
		while (ex_sys__experience[playerid] < ex_sys__scores[ex_sys__level{playerid}])
		{
			ex_sys__level{playerid}--;
		}
	}
	
	return 1;
}

stock GetPlayerExperience(playerid)
{
	new
	    getEx = ex_sys__experience[playerid] - ex_sys__scores[ex_sys__level{playerid}],
	    getLvlEx = ex_sys__scores[ex_sys__level{playerid} + 1] - ex_sys__scores[ex_sys__level{playerid}],
	    string[sizeof ex_sys__str + 3 + 11*2 - 2*3];


	format(string, sizeof string, ex_sys__str,
	    ex_sys__level{playerid},
	    getEx,
	    getLvlEx
	);

	return string;
}

stock ResetPlayerExperience(playerid, score)
{
	return ex_sys__level{playerid} = ex_sys__experience[playerid] = 0;
}

public OnPlayerDisconnect(playerid, reason)
{
	ex_sys__level{playerid} = 
	ex_sys__experience[playerid] = 0;

#if  defined ex_sys__OnPlayerDisconnect
	ex_sys__OnPlayerDisconnect(playerid, reason);
#endif
	return 1;
}

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect ex_sys__OnPlayerDisconnect
#if defined ex_sys__OnPlayerDisconnect
forward ex_sys__OnPlayerDisconnect(playerid, reason);
#endif
