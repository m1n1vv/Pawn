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
