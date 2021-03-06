//generate a room from a sprite
//script adapted from RealGMLTuts tutorial on youtube

var sprite = argument0;
var xoffset = argument1;
var yoffset = argument2;

draw_sprite(sprite,-1,0,0);

for (var xx = 0; xx < 32; xx++) {
    for (var yy = 0; yy < 32; yy++) {
        if (draw_getpixel(xx,yy) == $000033) { 
            tile_add(bkg_tiles,0,0,32,32,xx*32+xoffset,yy*32+yoffset,-99);
        }
        else if(draw_getpixel(xx,yy) == $0000FF) {
            tile_add(bkg_tiles,0,32,32,32,xx*32+xoffset,yy*32+yoffset,99);
            instance_create(xx*32+xoffset,yy*32+yoffset,obj_wall);
        }
        else if(draw_getpixel(xx,yy) == $80FF80) {
            tile_add(bkg_tiles,32,0,32,32,xx*32+xoffset,yy*32+yoffset,99);
            instance_create(xx*32+xoffset,yy*32+yoffset,obj_enemy_slime);
        }
        else if(draw_getpixel(xx,yy) == $FF0000) {
            tile_add(bkg_tiles,32,0,32,32,xx*32+xoffset,yy*32+yoffset,99);
            instance_create(xx*32+xoffset,yy*32+yoffset,obj_player);
        }
        else {
            tile_add(bkg_tiles,32,0,32,32,xx*32+xoffset,yy*32+yoffset,99);
        }
    }
}

draw_clear(sprite);
