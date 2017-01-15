//*arg - powerup type, powerup self duration, powerup tank duration, powerup pwr, x, y
type = argument0;
pduration = argument1;
duration = argument2;
pwr =  argument3
locationX = argument4;
locationY = argument5;

switch(type)
{
    case global.POWERUP_TURNRATE:
        powerup = instance_create(locationX,locationY,obj_powerup_turnrate);
        with(powerup)
        {
            pwr = other.pwr;
            pduration = other.pduration;
            duration = other.duration;
            alarm[0] = pduration*room_speed;
        }
        with(obj_powerup_controller)
        {
            ds_list_add(powerups,other.powerup);
        }
        break;
    default:
        break;

}
