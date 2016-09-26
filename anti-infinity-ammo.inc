static
	ac_time[MAX_PLAYERS],
	ac_ammo[MAX_PLAYERS];
  
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(GetTickCount() > ac_time[playerid])
	{
		new
			ammo = ac_ammo[playerid];

		ac_ammo[playerid] = GetPlayerAmmo(playerid);
		ac_time[playerid] = GetTickCount() + 1000;

		if (ammo == ac_ammo[playerid])
			return Kick(playerid);
	}
#if	defined	ac_ia__OnPlayerWeaponShot
	ac_ia__OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
	return 1;
}
#if	defined	_ALS_OnPlayerWeaponShot
	#undef	OnPlayerWeaponShot
#else
	#define	_ALS_OnPlayerWeaponShot
#endif
#define	OnPlayerWeaponShot	ac_ia__OnPlayerWeaponShot
#if defined ac_ia__OnPlayerWeaponShot
forward ac_ia__OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
