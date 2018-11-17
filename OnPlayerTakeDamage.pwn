/*0.1
Заметки:
- Из-за того, что OnPlayerTakeDamage не вызывается, когда игрок в AFK, пришлось сделать на это проверку;
- Когда не вызывется OnPlayerTakeDamage, эту работу выполняет OnPlayerWeaponShot;
- Такте OnPlayerWeaponShot определяет, идет ли стрельба по игроку. Сделано для OnPlayerKeyStateChange;
- Упущена проверка с отключенным OnPlayerTakeDamage и игроком в AFK.
*/

#include <a_samp>
#include <foreach>

main(){}

#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
	
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
	
#define LIMIT   50
#define TIMER   1000
	
static
	afk[MAX_PLAYERS char],
	afk_tick[MAX_PLAYERS],
	afk_check[MAX_PLAYERS][2],
	afk_info[MAX_PLAYERS char],
	
	reg_id[MAX_PLAYERS],
	
	checking[MAX_PLAYERS char],
	attempts[MAX_PLAYERS char];

public OnGameModeInit()
{
	SetTimer(!"CheckAFK", TIMER, true);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid, 0.0, 0.0, 3.0);
	GivePlayerWeapon(playerid, 31, 400);
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if ((GetTickCount() - afk_tick[playerid]) > TIMER)
	{
		afk_tick[playerid] = GetTickCount();
		afk_info{playerid} = !afk_info{playerid};
	}
	return 1;
}
	
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (RELEASED(KEY_FIRE))
	{
		static
			str[20];
	    	
		if (checking{playerid})
		{
			if (attempts{playerid} == LIMIT)
			{
				format(str, 100, "%i cheats {00FF00}ON", reg_id[playerid]);
				return SendClientMessageToAll(-1, str);
			}
			else
			{
				return SendClientMessageToAll(-1, !"cheats {FF0000}OFF");
			}
		}
	}
	if (HOLDING(KEY_FIRE))
	{
		return attempts{playerid} = LIMIT;
	}
	
	return 1;
}


public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if (hittype == BULLET_HIT_TYPE_PLAYER)
	{
		static
			str[20];

		checking{playerid} = 1;

		if (afk{hitid} == 1)
		{
			format(str, 100, "%i {A52A2A}---AFK---",hitid);
			SendClientMessageToAll(-1, str);
			
			reg_id[playerid] = hitid;
			if (attempts{playerid} != 0)
			{
				attempts{playerid}--;
			}
		}
	}
	else
	{
	    checking{playerid} = 0;
	}
	
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if (afk{playerid} == 0)
	{
		reg_id[issuerid] = playerid;

		if (attempts{issuerid} != 0)
		{
			attempts{issuerid}--;
		}
	}
	
	return 1;
}

forward CheckAFK();
public CheckAFK()
{
	foreach (Player, i)
	{
		afk_check[i][1] = afk_check[i][0];
		afk_check[i][0] = afk_info{i};

		if (afk_check[i][1] == afk_check[i][0])
		{
			afk{i} = 1;
		}
		else
		{
		    	afk{i} = 0;
		}
	}
	
	return 1;
}
