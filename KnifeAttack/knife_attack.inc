#if  defined MN_KNIFE_ATTACK_INCLUDED_
    #endinput
#endif 
#define MN_KNIFE_ATTACK_INCLUDED_

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{ 
	if ((newkeys & 16) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if (GetPVarInt(playerid, "Knife") > gettime()) 
			return 0;
		SetPVarInt(playerid, "Knife", gettime()+2);
		Knife100HP(playerid);
		return 1;
	}
#if defined mn_k__OnPlayerKeyStateChange
	mn_k__OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif
	return 1;
}
#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange mn_k__OnPlayerKeyStateChange
#if  defined mn_k__OnPlayerKeyStateChange
forward  mn_k__OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

static stock Knife100HP(playerid)
{
	new 
		Float:x,
		Float:y,
		Float:z,
		Float:health;
	GetPlayerHealth(playerid, health);
	if (health <= 10) 
		return 0;
	new 
		closest_veh = GetClosestVehicle(playerid, 3.0);
	if (closest_veh != INVALID_VEHICLE_ID) 
		return 0;
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		return 0;
	ApplyAnimation(playerid, "ped", "FightA_1", 4.0, 0, 0, 0, 0, 0, 1);
	SetPlayerAttachedObject(playerid, 9, 335, 5, 0.17, 0.0, 0.0, 0.0, 180.0, 0.0);
	SetTimerEx("@Knife100HPDO", 650, false, "i", playerid);
	PlayAudioStreamForPlayer(playerid, "http://tscars.narod.ru/sounds/knife1.mp3");
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		GetPlayerPos(i, x, y, z);
		if (!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
			continue;
		if (!IsPlayerConnected(i) || i == playerid)
			continue;
		PlayAudioStreamForPlayer(i, "http://tscars.narod.ru/sounds/knife1.mp3", x, y, z, 5.0, true);
		SetPlayerHealth(i, 0);
		SetPlayerLook(playerid, x, y);
		break;
	}
	return 1;																																																								
}

@Knife100HPDO(playerid);
@Knife100HPDO(playerid)
{
	RemovePlayerAttachedObject(playerid, 9);
	return 1;
}

static stock SetPlayerLook(playerid, Float:x, Float:y)
{
    new 
	    Float:pos_x, 
	    Float:pos_y, 
	    Float:angle;
    GetPlayerPos(playerid, pos_x, pos_y, angle);
    angle = atan2(y-pos_y, x-pos_x)-90.0;
    SetPlayerFacingAngle(playerid, angle);
    return 1;
}

static stock GetClosestVehicle(playerid, Float:radius = 3.0)
{
	new 
		Float:px, 
		Float:py, 
		Float:pz;
	GetPlayerPos(playerid, px, py, pz);
	for (new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
	{
		if (i != INVALID_VEHICLE_ID)
		{
			if (GetVehicleDistanceFromPoint(i, px, py, pz) <= radius)
			    return i;
		}
	}
	return INVALID_VEHICLE_ID;
}
