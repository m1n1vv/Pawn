static
	ac_ia__time[MAX_PLAYERS],
	ac_ia__ammo[MAX_PLAYERS];
  
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(GetTickCount() > ac_ia__time[playerid])
	{
		new
			ammo = ac_ia__ammo[playerid];

		ac_ia__ammo[playerid] = GetPlayerAmmo(playerid);
		ac_ia__time[playerid] = GetTickCount() + 1000;

		if (ammo == ac_ia__ammo[playerid])
			return Kick(playerid);
	}
#if	defined	ac_ia__ia__OnPlayerWeaponShot
	ac_ia__ia__OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
	return 1;
}
#if	defined	_ALS_OnPlayerWeaponShot
	#undef	OnPlayerWeaponShot
#else
	#define	_ALS_OnPlayerWeaponShot
#endif
#define	OnPlayerWeaponShot	ac_ia__ia__OnPlayerWeaponShot
#if defined ac_ia__ia__OnPlayerWeaponShot
forward ac_ia__ia__OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
