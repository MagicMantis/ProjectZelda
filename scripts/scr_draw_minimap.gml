//draw minimap
//script adapted from script by flyingsaucerinvasion on GML forum

if !surface_exists(map_surf) { map_surf = surface_create(200,200); }

surface_set_target(map_surf);

draw_clear_alpha(c_black, 0);  //or whatever background you want for the map

d3d_set_projection_ortho(0,0,room_width,room_height,0);  //set projection to whole room

var _scale = room_height / 320;  //calculate scale of icons

//draw map icons
with (obj_forest_start_room_left) { draw_sprite_ext(sprite_index,0,x,y,_scale,_scale,0,c_white,1); }
//draw player icon
with (obj_player) { 
    var px = floor(x / 1024) * 1024 + (1024)/4;
    var py = floor(y / 1024) * 1024 + (1024)/4;
    draw_sprite_ext(sprite_index,0,px,py,_scale/2,_scale/2,0,c_white,1); 
}

surface_reset_target();

draw_surface(map_surf,0,0);  //the map surface can be drawn anywere on the screen.

show_debug_message("called");

