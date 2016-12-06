stock SpawnCameraGTA5(playerid)
{
        new 
                Float:start = 200.0,
                Float:x,
                Float:y,
                Float:z;
        GetPlayerPos(playerid, x, y, z);
        InterpolateCameraPos(playerid, x, y, z+start, x, y, z+3.5, 10000);
        InterpolateCameraLookAt(playerid, x+0.5, y-0.2, z+start-5.0, x+0.5, y-0.2, z-5.0, 10000);
        return 1;
}
