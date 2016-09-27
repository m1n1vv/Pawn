stock AntiFLY(playerid)
{
	#define E_FLY__ANIMS		(1)
	
	enum e_fly__anim
	{
		e_fly__animname[32]
	};

	static const
		e_fly__animlib[][e_fly__anim] =
		{
			{"JUMP_LAND"}
		};

	new
		animlib[32], 
		animname[32];

	if (GetPlayerAnimationIndex(playerid))
	{
		GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);

		for (new i = 0; i < E_FLY__ANIMS; i++)
		{
			if (strcmp(animlib, e_fly__animlib[i][e_fly__animname], true))
				SendClientMessage(playerid, -1, !"FLY OFF");
			else
				SendClientMessage(playerid, -1, !"FLY ON");
		}
	}
        
	return 1;
}
