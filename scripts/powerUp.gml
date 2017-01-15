target_tank = argument0;
stat = argument1;
stat_change_amount = argument2;

switch(stat)
{
    case global.TANK_TURNSPEED:
        target_tank.turnspeed = stat_change_amount;
        break;
    case global.TANK_SPEED:
        target_tank.spd = stat_change_amount;
        break;
    case global.TANK_HEALTH:
        target_tank.hp = stat_change_amount;
        break;
}
