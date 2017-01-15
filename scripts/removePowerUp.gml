value = argument0;
with(obj_powerup_controller)
{
    ds_list_delete(powerups,ds_list_find_index(powerups,other.value));
}
with(value)
{
    instance_destroy();
}
