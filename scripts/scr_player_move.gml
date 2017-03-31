///script to set bindings
//Get input and move
var playerMovespeed = 3;

//show_debug_message(global.key_right+global.key_left+global.key_up+global.key_down);
//show_debug_message(keyboard_check(global.key_right));
var hspd = (keyboard_check(global.key_right)-keyboard_check(global.key_left))*playerMovespeed;
var vspd = (keyboard_check(global.key_down)-keyboard_check(global.key_up))*playerMovespeed;
//calculate facing direction
if (hspd > 0 and vspd == 0) facing_dir = 0;
if (vspd < 0 and hspd == 0) facing_dir = 1;
if (hspd < 0 and vspd == 0) facing_dir = 2;
if (vspd > 0 and hspd == 0) facing_dir = 3;

//handle attack
if (keyboard_check( global.key_attack )) {
    image_speed=1;
    //image_index=1;
    show_debug_message("J pressed \n");
}
script_execute(scr_character_move, hspd, vspd); 
    



