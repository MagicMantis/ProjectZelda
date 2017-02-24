///move character

var hspd = argument0;
var vspd = argument1;

//Speed fix
if(hspd != 0 and vspd != 0)
    {
    hspd *= sqrt(2)/2;
    vspd *= sqrt(2)/2;
    }
    
//checks player space if free

if(place_meeting(x + hspd, y, obj_wall))
    {
    while(!place_meeting(x + sign(hspd), y, obj_wall))
        x += sign(hspd);
    hspd = 0;
    }
x += hspd;

if(place_meeting(x, y + vspd, obj_wall))
    {
    while(!place_meeting(x, y + sign(vspd), obj_wall))
        y += sign(vspd);
    vspd = 0;
    }
y += vspd
