stock SpawnCameraGTA5(playerid, Float:px, Float:py, Float:pz, Float:pa, time = 10000)
{
        new 
                Float:start = 200.0,
                Float:fx,
                Float:fy;
        fx = px + floatsin(pa, degrees);
        fy = py - floatcos(pa, degrees);
        InterpolateCameraPos(playerid, fx, fy, pz+start, fx, fy, pz+5.0, time);
        InterpolateCameraLookAt(playerid, px, py, pz+start-5.0, px, py, pz+1.0, time);
        return 1;
}

public Spawn(playerid)
{
        new
                Float:x, 
                Float:y, 
                Float:z, 
                Float:a;
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, a);
        SpawnCameraGTA5(playerid, x, y, z, a);
        return 1;
}
