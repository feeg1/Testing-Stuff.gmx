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
        //First, get the info we need from the old gun
        spawn_type = noone;
        bullet_type = noone;
        source_type = noone;
        with(tank_id.gun)
        {
            other.spawn_type = spawn_type;
            other.bullet_type = bullet_type;
            other.source_type = source_type;
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
        with(gunId)
        {
            spawn_type = other.spawn_type;
            bullet_type = other.bullet_type;
            source_type = other.source_type;
        }
        //Give gun id to tank
        tank_id.gun = gunId;
        //Give tank id to gun
        gunId.tank_id = tank_id;
        break;
    case global.PICKUP_TYPE_BULLET_SPAWN:
        with(tank_id.gun.spawn_type)
        {
            instance_destroy();
        }
        switch(object_type_id)
        {
            case global.BULLET_SPAWN_DEFAULT:
                tank_id.gun.spawn_type = obj_default_shot;
                break;
            case global.BULLET_SPAWN_TRIPLE:
                tank_id.gun.spawn_type = obj_triple_shot;
                break;
            default:
                break;
        }
        break;
    case global.PICKUP_TYPE_BULLET:
        break;
}
