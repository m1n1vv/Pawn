#if  defined MN_HYDRA_SPEED_INCLUDED_
    #endinput
#endif 
#define MN_HYDRA_SPEED_INCLUDED_

static
	BarrierInfor[MAX_PLAYERS],
	Proof_1[MAX_PLAYERS char], 
	Proof_2[MAX_PLAYERS char], 
	Proof_3[MAX_PLAYERS char],
	StopBar[MAX_PLAYERS char],
	bool:N1[MAX_PLAYERS char], 
	bool:N2[MAX_PLAYERS char],
	HrSpeed[MAX_PLAYERS char]; 

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_DRIVER)
	{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
		{
			new 
				hydra; 
			hydra = GetPlayerVehicleID(playerid);
			SetVehicleSpeed(hydra, 0);
			BarrierInfor[playerid] = SetTimerEx("@HydraInfo", 0, true, "i", playerid);
			N1{playerid} = false;
			N2{playerid} = false;
		}
		return 1;
	}
	if (newstate == PLAYER_STATE_ONFOOT)
	{
		KillTimer(BarrierInfor[playerid]);
		Proof_1{playerid} = 0;
		Proof_2{playerid} = 0;
		Proof_3{playerid} = 0;
		StopBar{playerid} = 3;
		N1{playerid} = false;
		N2{playerid} = false;
		return 1;
	}
#if defined mn_h__OnPlayerStateChange
	mn_h__OnPlayerStateChange(playerid, newstate, oldstate);
#endif
    return 1;
}
#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange mn_h__OnPlayerStateChange
#if defined mn_h__OnPlayerStateChange
forward mn_h__OnPlayerStateChange(playerid, newstate, oldstate);
#endif

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)   
{   
	if (newkeys & 131072 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
		{
			if (IsPlayerInAnyVehicle(playerid))
			{
				if (N1{playerid} == true && N2{playerid} == true)
				{
					StopBar{playerid} = 1;
					N1{playerid} = false;
				}
				else if (N1{playerid} == false)
				{
					StopBar{playerid} = 2;
					N1{playerid} = true;
				}
			}
		}
	}
#if defined mn_h__OnPlayerKeyStateChange
	mn_h__OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif
    return 1;
}
#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange mn_h__OnPlayerKeyStateChange
#if defined mn_h__OnPlayerKeyStateChange
forward mn_h__OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

public OnPlayerDeath(playerid, killerid, reason)
{
    Proof_1{playerid} = 0;
	Proof_2{playerid} = 0;
	Proof_3{playerid} = 0;
	StopBar{playerid} = 3;
	N1{playerid} = false;
	N2{playerid} = false;
	KillTimer(BarrierInfor[playerid]);
#if defined mn_h__OnPlayerDeath
	mn_h__OnPlayerDeath(playerid, killerid, reason);
#endif
    return 1;
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath mn_h__OnPlayerDeath
#if defined mn_h__OnPlayerDeath
forward mn_h__OnPlayerDeath(playerid, killerid, reason);
#endif

public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(BarrierInfor[playerid]);
    Proof_1{playerid} = 0;
	Proof_2{playerid} = 0;
	Proof_3{playerid} = 0;
	StopBar{playerid} = 3;
	N1{playerid} = false;
	N2{playerid} = false;
#if defined mn_h__OnPlayerDisconnect
	mn_h__OnPlayerDisconnect(playerid, reason);
#endif
    return 1;
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect mn_h__OnPlayerDisconnect
#if defined mn_h__OnPlayerDisconnect
forward mn_h__OnPlayerDisconnect(playerid, reason);
#endif

@HydraInfo(playerid);
@HydraInfo(playerid)
{
	new 
		nothydra;
	nothydra = GetVehicleModel(GetPlayerVehicleID(playerid));
	if (nothydra == 520)
	{
		HrSpeed{playerid} = SpeedVehicle(playerid);
		if (HrSpeed{playerid} >= 150)
		{
			Proof_1{playerid} ++;
			if (Proof_1{playerid} == 1)
			{
				SendClientMessage(playerid, -1, !"Нажмите {ff0000}N{ffffff}, Чтобы перейти звуковой барьер");
				N1{playerid} = true;
				N2{playerid} = true;
				Proof_1{playerid} = 2;
				Proof_2{playerid} = 0;
				Proof_3{playerid} = 0;
			}
		}
		if (HrSpeed{playerid} < 145)
		{
			Proof_3{playerid} ++;
			if (Proof_3{playerid} == 1)
			{
				Proof_1{playerid} = 0;
				Proof_2{playerid} = 0;
				Proof_3{playerid} = 2;
				N1{playerid} = false;
				N2{playerid} = false;
			}
		}
		if (StopBar{playerid} == 1)
		{
			new 
				Float:x,
				Float:y,
				Float:z,
				Float:a,
				Float:dist = 5.0; //новая скорость
			new
				hyd;
			hyd = GetPlayerVehicleID(playerid);
			GetVehiclePos(hyd, x, y, z);
			GetVehicleZAngle(hyd, a);
			SetVehiclePos(hyd, x + dist * -floatsin(a, degrees), y + dist * floatcos(a, degrees), z);
			Proof_2{playerid} = 1;
		}
		if (StopBar{playerid} == 2)
		{
			if (Proof_2{playerid} == 1 && N1{playerid} == true) 
			{
				new
					hyd;
            			hyd = GetPlayerVehicleID(playerid);
				SetVehicleSpeed(hyd, 500);
			}
		}
	}
	return 1;
}

stock SpeedVehicle(playerid)
{
	new 
		Float:x,
		Float:y,
		Float:z,
		Float:a;
	if (IsPlayerInAnyVehicle(playerid)) 
		GetVehicleVelocity(GetPlayerVehicleID(playerid), x, y, z);
	else 
	GetPlayerVelocity(playerid, x, y, z);
	a = floatsqroot(floatpower(floatabs(x), 2.0) + floatpower(floatabs(y), 2.0) + floatpower(floatabs(z), 2.0)) * 100.3;
	return floatround(a);
}

stock SetVehicleSpeed(vehicleid, Float:speed)
{
	new 
		Float:x1, 
		Float:y1, 
		Float:z1, 
		Float:x2, 
		Float:y2, 
		Float:z2, 
		Float:a;
	GetVehicleVelocity(vehicleid, x1, y1, z1);
	GetVehiclePos(vehicleid, x2, y2, z2);
	GetVehicleZAngle(vehicleid, a); a = 360 - a;
	x1 = (floatsin(a, degrees) * (speed/100) + floatcos(a, degrees) * 0 + x2) - x2;
	y1 = (floatcos(a, degrees) * (speed/100) + floatsin(a, degrees) * 0 + y2) - y2;
	SetVehicleVelocity(vehicleid, x1, y1, z1);
}
