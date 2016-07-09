![Image alt](http://pawn-wiki.ru/uploads/imgs/img_1466732388__bw-logo.png)
> ###Версия: 0.3.6.1###

Этот include добавляет покупку оружие с подробной информацией. Все действия будут происходишь в двух диалоговых окнах. В основном диалоге выводится вся информация об оружии. Если во время покупки система определит, что у вас в этом же слоте уже есть оружие, то высветится второй диалог, который предложит заменить.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=f72H9AEBAKUE" target="_blank"><img src="http://img.youtube.com/vi/f72H9AEBAKU/0.jpg" 
alt="SA:MP Include BuyWeapons" width="240" height="180" border="10" /></a>

Установка
---------
```pawn
#include <mn_buyweapons>
```

Параметры
---------
> 
> ```pawn
BuyWeapons(playerid, weaponid);
```
> 
> * **playerid** - id игрока
> * **weaponid** - id оружия (с 22 по 34)

Применение
----------
```pawn
switch(listitem)
{
        case 0: BuyWeapons(playerid, 23); //Silenced 9mm
        case 1: BuyWeapons(playerid, 27); //Combat Shotgun
        case 2: BuyWeapons(playerid, 28); //Micro SMG/Uz
        case 3: BuyWeapons(playerid, 31); //M4
        case 4: BuyWeapons(playerid, 34); //Sniper Rifle
}
```
Полная инструкция: [https://github.com/m1n1vv/.../example.pwn](https://github.com/m1n1vv/Pawn/blob/master/BuyWeapons/example.pwn)
Этапы развития
--------------

|0.1|0.2|0.3|
|:-:|:-:|:-:|
|[**0.1.1**](https://github.com/m1n1vv/Pawn/blob/master/BuyWeapons/outdated_scripts/buy_weapons_0.1.inc)|0.2 test|0.3.1|
||0.2.1|0.3.2|
||0.2.2|0.3.3|
||[**0.2.3**](https://github.com/m1n1vv/Pawn/blob/master/BuyWeapons/outdated_scripts/buy_weapons_0.2.inc)|0.3.4|
|||0.3.5|
|||0.3.6|
|||[**0.3.6.1**](https://github.com/m1n1vv/Pawn/blob/master/BuyWeapons/mn_buyweapons.inc)|
