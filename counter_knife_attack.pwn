forward Knife100HP(playerid); 
forward Knife100HPDO(playerid);
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys) 
{ 
	if((newkeys & 16) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if(GetPVarInt(playerid, "Knife") > gettime()) return 1;
		SetPVarInt(playerid, "Knife", gettime()+2);
		SetTimerEx("Knife100HP", 0, false, "i", playerid);
		return 1;
	}
	return 1; 
} 
public Knife100HP(playerid)
{
	new Float:health;
	GetPlayerHealth(playerid, health);
	if(health <= 10) return 1;
	new vehid = GetClosestCar(playerid, 5.0);
	for(new i = 0; i < MAX_VEHICLES; i++) if(i == vehid) return 1;
	SetPlayerArmedWeapon(playerid, 0);
	ApplyAnimation(playerid, "ped", "FightA_1", 4.0, 0, 0, 0, 0, 0, 1);
	SetPlayerAttachedObject(playerid, 6, 335, 5, 0.17, 0.0, 0.0, 0.0, 180.0, 0.0);
	SetTimerEx("Knife100HPDO", 650, false, "i", playerid);
	new Float:p[3];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
#if defined foreach
	foreach(Player, i)
#elseif defined GetPlayerPoolSize
	for(new i = GetPlayerPoolSize(); --i != 0;)
#else
	for(new i = 0; ++i != MAX_PLAYERS;)
#endif
	{
		if(IsPlayerInRangeOfPoint(i, 3.0, p[0], p[1], p[2]))
			PlayAudioStreamForPlayer(i, "http://tscars.narod.ru/sounds/knife1.mp3", p[0], p[1], p[2], 5.0, true);
		GetPlayerTurn(playerid, p[0], p[1], p[2], 1.0, 180);
		if(!IsPlayerConnected(i) || i == playerid) continue;
		return SetPlayerHealth(i, random(100));
	}
	return 1;
}
public Knife100HPDO(playerid)
{
	RemovePlayerAttachedObject(playerid, 6);
	return 1;
}
stock GetClosestCar(playerid, Float:dist)
{ 
	new Float:x, Float:y, Float:z; 
	for(new i = 0; i < MAX_VEHICLES; i++)
	{ 
		if(GetVehicleModel(i) == 0) continue;
		GetVehiclePos(i, x, y, z); 
		if(IsPlayerInRangeOfPoint(playerid, dist, x, y, z)) 
		return i;
	}
	return -1; 
}
stock GetPlayerTurn(playerid, &Float:x, &Float:y, &Float:z, Float:distance, turn)
{
	new Float:angle, Float:dis;
	dis = dis/2 - distance;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);
	x += (dis * floatsin(-angle+turn, degrees));
	y += (dis * floatcos(-angle+turn, degrees));
	return 1;
}
