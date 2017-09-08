#if !defined MAX_HYDRA_TIMER
	#define MAX_HYDRA_TIMER		100
#endif

#if !defined MAX_HYDRA_VEHICLES
	#define MAX_HYDRA_VEHICLES	250
#endif

static
	hydra__id[MAX_VEHICLES],
	hydra__alpha[MAX_VEHICLES],

	hydra__aim[MAX_VEHICLES],
	hydra__height[MAX_VEHICLES],
	hydra__speed[MAX_VEHICLES],
	hydra__hp[MAX_VEHICLES];

stock CreateFutureHydra(Float:x, Float:y, Float:z, Float:angle, respawn)
{
	static
		vehicleid;

	vehicleid = CreateVehicle(520, x, y, z, angle, -1, -1, respawn);
	hydra__id[vehicleid] = 1;

	CreateHydraObjects(vehicleid);

	return vehicleid;
}
public OnVehicleSpawn(vehicleid)
{
	if (hydra__id[vehicleid])
	{
		CreateHydraObjects(vehicleid);
	}
#if defined hydra__OnVehicleSpawn
	hydra__OnVehicleSpawn(vehicleid);
#endif
	return 1;
}

public OnVehicleDeath(vehicleid)
{
	DestroyDynamicObject(hydra__aim[vehicleid]);
	DestroyDynamicObject(hydra__height[vehicleid]);
	DestroyDynamicObject(hydra__hp[vehicleid]);
	DestroyDynamicObject(hydra__speed[vehicleid]);

#if defined hydra__OnVehicleDeath
	hydra__OnVehicleDeath(vehicleid);
#endif

	return 1;
}

public OnGameModeInit()
{
	SetTimer("HydraTimer", MAX_HYDRA_TIMER, 1);
#if defined free__OnGameModeInit
	free__OnGameModeInit();
#endif

	return 1;
}

forward HydraTimer();
public HydraTimer()
{
	for (new i = 1, j = GetVehiclePoolSize(); i <= j; i++)
	{
		if (!hydra__id[i])
			continue;

		new
			string[8],
			Float:__,
			Float:_float,
			_int,
			alpha = hydra__alpha[i];

		GetVehicleHealth(i, _float);
		alpha = (alpha < 10) ? (++alpha) : (1);
		hydra__alpha[i] = alpha;

		valstr(string, floatround(_float));
		strcat(string, "HP");
		SetDynamicObjectMaterialText(hydra__hp[i], 0, string, 130, !"Arial", 140, 1, -23296, 0, 1);

		_int = SpeedVehicle(i);
		valstr(string, _int);
		strcat(string, "KM/H");
		SetDynamicObjectMaterialText(hydra__speed[i], 0, string, 130, !"Arial", 140, 1, -23296, 0, 1);

		GetVehiclePos(i, __, __, _float);
		valstr(string, floatround(_float));
		strcat(string, "^");
		SetDynamicObjectMaterialText(hydra__height[i], 0, string, 130, !"Arial", 230, 1, -1, -23296, 1);
	}

	return 1;
}

static stock CreateHydraObjects(vehicleid)
{
	hydra__hp[vehicleid] = CreateDynamicObject(19477, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
	AttachDynamicObjectToVehicle(hydra__hp[vehicleid], vehicleid, -2.558614, -0.168310, 0.405535, 11.600008, -30.000000, -65.015716);

	hydra__speed[vehicleid] = CreateDynamicObject(19477, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
	AttachDynamicObjectToVehicle(hydra__speed[vehicleid], vehicleid, 2.558614, -0.168310, 0.405535, -11.600008, -30.000000, 245.015716);

	hydra__height[vehicleid] = CreateDynamicObject(19476, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
	AttachDynamicObjectToVehicle(hydra__height[vehicleid], vehicleid, 0.523670, -6.738031, 2.013909, 0.000000, 0.000000, -89.992889);

	hydra__aim[vehicleid] = CreateDynamicObject(19477, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(hydra__aim[vehicleid], 0, !"=O=", 130, !"Arial", 200, 1, -65536, 0, 1);
	AttachDynamicObjectToVehicle(hydra__aim[vehicleid], vehicleid, -0.946332, 93.174057, -0.350000, 0.000000, 0.000000, -89.372711); 

	return 1;
}

stock SpeedVehicle(vehicleid)
{
    new
    	Float:x, Float:y, Float:z;
    GetVehicleVelocity(vehicleid, x, y, z);
    return floatround(floatsqroot(x*x+y*y+z*z)*100);
}

#if defined _ALS_OnVehicleSpawn
	#undef OnVehicleSpawn
#else
	#define _ALS_OnVehicleSpawn
#endif
#define  OnVehicleSpawn hydra__OnVehicleSpawn
#if defined hydra__OnVehicleSpawn
forward hydra__OnVehicleSpawn(vehicleid);
#endif

#if defined _ALS_OnVehicleDeath
	#undef OnVehicleDeath
#else
	#define _ALS_OnVehicleDeath
#endif
#define  OnVehicleDeath hydra__OnVehicleDeath
#if defined hydra__OnVehicleDeath
forward hydra__OnVehicleDeath(vehicleid);
#endif

#if defined _ALS_OnGameModeInit
	    #undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit free__OnGameModeInit
#if  defined free__OnGameModeInit
forward free__OnGameModeInit();
#endif
