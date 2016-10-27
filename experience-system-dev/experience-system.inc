/*****************************************
* Experience System 0.1.1
* by m1n1vv
*****************************************/

#if  defined MN__EXPERIENCE_SYSTEM__INCLUDED
	#endinput
#endif 
#define MN__EXPERIENCE_SYSTEM__INCLUDED	

#if  !defined ex_sys__level
	new
		ex_sys__level[MAX_PLAYERS char];
#endif 

#if  !defined ex_sys__experience
	new
		ex_sys__experience[MAX_PLAYERS];
#endif 										

static const
	ex_sys__scores[] =
	{
		0,
		50,
		150,
		500,
		1700,
		3500
	};

stock GivePlayerExperience(playerid, score)
{
	ex_sys__experience[playerid] += score;

	if (score >= 0)
	{
		while (ex_sys__experience[playerid] > ex_sys__scores[ex_sys__level{playerid} + 1])
		{
			ex_sys__level{playerid}++;
		}
	}
	else
	{
		while (ex_sys__experience[playerid] < ex_sys__scores[ex_sys__level{playerid}] && ex_sys__level{playerid} != 0)
		{
			ex_sys__level{playerid}--;
		}
	}

	return 1;
}

stock GetPlayerExperience(playerid, &getxp, &getlvlxp)
{
	getxp = ex_sys__experience[playerid] - ex_sys__scores[ex_sys__level{playerid}];
	getlvlxp = ex_sys__scores[ex_sys__level{playerid} + 1] - ex_sys__scores[ex_sys__level{playerid}];

	return 1;
}

stock ResetPlayerExperience(playerid)
{
	return ex_sys__level{playerid} = ex_sys__experience[playerid] = 0;
}

public OnPlayerDisconnect(playerid, reason)
{
	ResetPlayerExperience(playerid);

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
