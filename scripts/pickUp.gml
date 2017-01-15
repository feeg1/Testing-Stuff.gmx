//Tank we are effecting
tank_id = argument0;
//Type of pickup (gun,bullet,bulletspawn,etc.)
pickup_type = argument1
//What type of type of pickup (machinegun gun, defaultgun, etc.)
object_type_id = argument2;
//How long the pickup lasts (-1 means permanent)
duration = argument3;
switch(pickup_type)
{
    case global.PICKUP_TYPE_GUN:
        with(tank_id.gun)
        {
            instance_destroy();
        }
        switch(object_type_id)
        {
            case global.GUN_DEFAULTGUN:
                obj = obj_default_gun;
                break;
            case global.GUN_MACHINEGUN:
                obj = obj_machinegun;
                break;
            default:
                break;
        }
        //Create gun
        gunId = instance_create(tank_id.x,tank_id.y,obj);
        //Set guns source type (friendly,enemy,all) to the same as tanks.
        gunId.source_type = tank_id.source_type;
        //Give gun id to tank
        tank_id.gun = gunId;
        //Give tank id to gun
        gunId.tank_id = tank_id;
        break;
    case global.PICKUP_BULLET_SPAWN:
        break;
    case global.PICKUP_BULLET_TYPE:
        break;
}
