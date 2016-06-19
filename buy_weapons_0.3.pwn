#if  defined MN_BUY_WEAPONS_INCLUDED_
	#endinput
#endif 
#define MN_BUY_WEAPONS_INCLUDED_

#if  !defined DIALOG_WEAPONS_ID
	#define DIALOG_WEAPONS_ID 18498
#endif

#if  !defined DIALOG_PROOF_OF_PURCHASE
	#define DIALOG_PROOF_OF_PURCHASE DIALOG_WEAPONS_ID+1
#endif 

#define GetWeaponSlot(%0) mn_weapon_slot_id[(GetPlayerWeapon(%0) == -1)?0:GetPlayerWeapon(%0)]

static
	mn_weaponid[MAX_PLAYERS char],
	mn_ammunition[MAX_PLAYERS char],
	mn_slot[MAX_PLAYERS char],
	mn_price[MAX_PLAYERS];

static const
	mn_buystat_weap_name[][] =
	{
		"9mm",
		"Silenced 9mm",
		"Desert Eagle",
		"Shotgun",
		"Sawnoff Shotgun",
		"Combat Shotgun",
		"Micro SMG/Uzi",
		"MP5",
		"AK-47",
		"M4",
		"Tec-9",
		"Country Rif le",
		"Sniper Rif le"
	},
	mn_buystat_caliber[][] =
	{
		".45",
		".45",
		".50",
		"12-й",
		"12-й",
		"12-й",
		"9x19 мм Парабеллум",
		"9x19 мм Парабеллум",
		"7,62 мм",
		"5,56x45 мм НАТО",
		"9x19 мм Парабеллум",
		"7,62 мм",
		"7,62 мм"
	},
	mn_buystat_shooting_range[][] =
	{
		"30-35 метров",
		"30-35 метров",
		"30-35 метров",
		"40 метров",
		"30-35 метров",
		"40 метров",
		"30-35 метров",
		"40-45 метров",
		"70 метров",
		"90 метров",
		"30-35 метров",
		"100 метров",
		"100 метров"
	},
	mn_weapon_slot_id[] = 
	{ 
		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,3,3,3,4,4,4,5,5,6,6
	},
	mn_str_buy[] =
	{
		"Оружие: \t\t\t%s\n\n\
		Калибр: \t\t\t%s\n\
		Патронов в обойме: \t\t%i\n\
		Дальность стрельбы: \t\t%s\n\
		Цена: \t\t\t\t$%i"
	},
	mn_str_res[] =
	{
		"У Вас уже есть оружие в этом слоте\n\n\
		Заменить %s на %s?"
	};
stock BuyWeapons(playerid, weaponid)
{
	mn_weaponid{playerid} = weaponid; 
	weaponid -= 22;
	Switch_library(playerid);
	static 
		string[sizeof mn_str_buy+(15+18+2+12+5)-(2*5+14+5)];
	format(string, sizeof string, mn_str_buy, 
		mn_buystat_weap_name[weaponid], 
		mn_buystat_caliber[weaponid], 
		mn_ammunition{playerid}, 
		mn_buystat_shooting_range[weaponid], 
		mn_price[playerid]);
	ShowPlayerDialog(playerid, DIALOG_WEAPONS_ID, DIALOG_STYLE_MSGBOX, "Покупка оружия", string, "Купить", "Закрыть");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_WEAPONS_ID)
	{
		new
			mn_player_slot[7],
			mn_player_weapons[7],
			mn_player_ammo[7];

		if (0 == response)
			return SendClientMessage(playerid, 0xAA3333AA, !"Покупка отклонена");
		for (new i = 2; i < 7; i++)
		{
			GetPlayerWeaponData(playerid, i, mn_player_weapons[i], mn_player_ammo[i]);
			mn_player_slot[i] = mn_weapon_slot_id[mn_player_weapons[i]];
			if (mn_player_weapons[i] == mn_weaponid{playerid} && mn_player_ammo[i] != 0)
				return SendClientMessage(playerid, 0xAA3333AA, !"У Вас уже есть это оружие");
			if (mn_player_slot[i] == mn_slot{playerid})
			{
				new 
					string[sizeof mn_str_res+15*2-4];
				format(string, sizeof string, mn_str_res,
					mn_buystat_weap_name[mn_player_weapons[i]-22],
					mn_buystat_weap_name[mn_weaponid{playerid}-22]);
				SendClientMessage(playerid, 0xAA3333AA, "При подтверждении все патроны старого оружия удалятся");
				return ShowPlayerDialog(playerid, DIALOG_PROOF_OF_PURCHASE, DIALOG_STYLE_MSGBOX, "Внимание!", string, "Да", "Закрыть");
			}
		}
		Buy(playerid);
		return 1;
	}
	else if (dialogid == DIALOG_PROOF_OF_PURCHASE)
	{
		if (0 == response)
			return SendClientMessage(playerid, 0xAA3333AA, !"Покупка отклонена");
		Buy(playerid);
		return 1;
	}
#if  defined mn_bw__OnDialogResponse
	mn_bw__OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
#endif 
	return 0;
}
#if  defined _ALS_OnDialogResponse
	#undef OnDialogResponse
#else
	#define _ALS_OnDialogResponse
#endif 
#define OnDialogResponse mn_bw__OnDialogResponse
#if  defined mn_bw__OnDialogResponse
forward mn_bw__OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
#endif 

public OnPlayerDisconnect(playerid, reason)
{
	mn_weaponid{playerid} =
	mn_ammunition{playerid} =
	mn_price[playerid] = 0;
#if  defined mn_bw__OnPlayerDisconnect
	mn_bw__OnPlayerDisconnect(playerid, reason);
#endif 
	return 1;
}
#if  defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif 
#define OnPlayerDisconnect mn_bw__OnPlayerDisconnect
#if  defined mn_bw__OnPlayerDisconnect
forward mn_bw__OnPlayerDisconnect(playerid, reason);
#endif 

static stock Switch_library(playerid)
{
	switch(mn_weaponid{playerid})
	{
		case WEAPON_COLT45, WEAPON_SILENCED: mn_ammunition{playerid} = 17;
		case WEAPON_DEAGLE, WEAPON_SHOTGSPA: mn_ammunition{playerid} = 7;
		case WEAPON_SHOTGUN, WEAPON_RIFLE, WEAPON_SNIPER: mn_ammunition{playerid} = 1;
		case WEAPON_SAWEDOFF: mn_ammunition{playerid} = 2;
		case WEAPON_UZI, WEAPON_M4, WEAPON_TEC9: mn_ammunition{playerid} = 50;
		case WEAPON_MP5, WEAPON_AK47: mn_ammunition{playerid} = 30;
	}
	switch(mn_weaponid{playerid})
	{
		case WEAPON_COLT45: mn_price[playerid] = 1720;
		case WEAPON_SILENCED: mn_price[playerid] = 2135;
		case WEAPON_DEAGLE: mn_price[playerid] = 2476;
		case WEAPON_SHOTGUN: mn_price[playerid] = 1459;
		case WEAPON_SAWEDOFF: mn_price[playerid] = 1928;
		case WEAPON_SHOTGSPA: mn_price[playerid] = 2836;
		case WEAPON_UZI: mn_price[playerid] = 1838;
		case WEAPON_MP5: mn_price[playerid] = 2382;
		case WEAPON_AK47: mn_price[playerid] = 3718;
		case WEAPON_M4: mn_price[playerid] = 3967;
		case WEAPON_TEC9: mn_price[playerid] = 2593;
		case WEAPON_RIFLE: mn_price[playerid] = 4391;
		case WEAPON_SNIPER: mn_price[playerid] = 5628;
	}
	switch(mn_weaponid{playerid})
	{
		case 22, 23, 24: mn_slot{playerid} = 2;
		case 25, 26, 27: mn_slot{playerid} = 3;
		case 28, 29, 32: mn_slot{playerid} = 4;
		case 30, 31: mn_slot{playerid} = 5;
		case 33, 34: mn_slot{playerid} = 6;
	}
	return 1;
}

static stock Buy(playerid)
{
	if (GetPlayerMoney(playerid) < mn_price[playerid]) 
		return SendClientMessage(playerid, 0xAA3333AA, !"У Вас недостаточно средств");
	GivePlayerMoney(playerid, -mn_price[playerid]);
	GivePlayerWeapon(playerid, mn_weaponid{playerid}, 1);
	SetPlayerAmmo(playerid, mn_weaponid{playerid}, mn_ammunition{playerid}-1);
	SendClientMessage(playerid, 0x33AA33AA, !"Вы успешно совершили покупку");
	return 1;
} 
