///scr_compile_room(sprite, index)

sprite = argument0
index = argument1

draw_sprite(sprite,-1,0,0);

show_debug_message("xoffset = argument0;");
show_debug_message("yoffset = argument1;");

for (xx = 0; xx < 32; xx++) {
    for (yy = 0; yy < 32; yy++) {
        if (draw_getpixel(xx,yy) == $000033) { 
            show_debug_message("tile_add(bkg_tiles,0,0,32,32,"+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,-99);");
        }
        else if(draw_getpixel(xx,yy) == $0000FF) {
            show_debug_message("tile_add(bkg_tiles,0,32,32,32,"+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,99);");
            show_debug_message("instance_create("+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,obj_wall);");
        }
        else if(draw_getpixel(xx,yy) == $80FF80) {
            show_debug_message("tile_add(bkg_tiles,32,0,32,32,"+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,99);");
            show_debug_message("instance_create("+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,obj_enemy);");
        }
        else if(draw_getpixel(xx,yy) == $FF0000) {
            show_debug_message("tile_add(bkg_tiles,32,0,32,32,"+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,99);");
            show_debug_message("instance_create("+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,obj_player);");
        }
        else {
            show_debug_message("tile_add(bkg_tiles,32,0,32,32,"+string(xx)+"*32+xoffset,"+string(yy)+"*32+yoffset,99);");
        }
    }
}

draw_clear(sprite);
