///script to set bindings
//Get input and move


var playerMovespeed = 3;
show_debug_message(global.key_right+global.key_left+global.key_up+global.key_down);
show_debug_message(keyboard_check(global.key_right));
var hspd = (keyboard_check(global.key_right)-keyboard_check(global.key_left))*playerMovespeed;
var vspd = (keyboard_check(global.key_down)-keyboard_check(global.key_up))*playerMovespeed;
if(keyboard_check(ord('J'))){
    image_speed=1;
    //image_index=1;
    show_debug_message("J pressed \n");
}
script_execute(scr_character_move, hspd, vspd); 
    



