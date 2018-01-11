main()
{
        new
                Float:x,
                Float:y,
                width = 1920,
                height = 1080;
        
        GetSpriteSize(width, height, 15, 15, x, y);
        printf("x: %.2f\ny: %.2f", x, y);
}

stock GetSpriteSize(width, height, wt, ht, &Float:ws, &Float:hs)
{
        ws = wt*(640.0*100.0/width)/100.0;
        hs = ht*(448.0*100.0/height)/100.0;
        return 1;
}
