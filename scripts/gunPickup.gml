tank_id = argument0;
gun_id = argument1;
with(tank_id.gun)
{
    instance_destroy();
}
switch(gun_id)
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
gunId = instance_create(tank_id.x,tank_id.y,obj);
gunId.source_type = tank_id.source_type;
tank_id.gun = gunId;
gunId.tank_id = tank_id;
