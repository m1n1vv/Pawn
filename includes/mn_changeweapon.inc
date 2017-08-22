#if  defined MN__CW__INCLUDED
    #endinput
#endif
#define MN__CW__INCLUDED

static
    cw__tick[MAX_PLAYERS],
    cw__changeid[MAX_PLAYERS char];

public OnPlayerUpdate(playerid)
{
    if ((GetTickCount() - cw__tick[playerid]) > 50)
    {
        cw__tick[playerid] = GetTickCount();

        static
            newweapon,
            oldweapon;

        oldweapon = cw__changeid{playerid};
        newweapon = GetPlayerWeapon(playerid);

        if (newweapon != cw__changeid{playerid})
        {
            cw__changeid{playerid} = newweapon;

            CallLocalFunction("OnPlayerChangeWeapon", "iii", 
                playerid,
                newweapon,
                oldweapon
            );
        }
    }
    
#if defined mn_cw__OnPlayerUpdate
    mn_cw__OnPlayerUpdate(playerid);
#endif

    return 1;
}
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define  OnPlayerUpdate mn_cw__OnPlayerUpdate
#if defined mn_cw__OnPlayerUpdate
forward mn_cw__OnPlayerUpdate(playerid);
#endif

forward OnPlayerChangeWeapon(playerid, newweapon, oldweapon);
