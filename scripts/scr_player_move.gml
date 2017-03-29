///script to set bindings
//Get input and move
var playerMovespeed = 5;
var hspd = (keyboard_check(vk_right)-keyboard_check(vk_left))*playerMovespeed;
var vspd = (keyboard_check(vk_down)-keyboard_check(vk_up))*playerMovespeed;

script_execute(scr_character_move, hspd, vspd); 
    



