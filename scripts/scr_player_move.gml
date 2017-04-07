///script to set bindings
//Get input and move
var playerMovespeed = 3;

//show_debug_message(global.key_right+global.key_left+global.key_up+global.key_down);
//show_debug_message(keyboard_check(global.key_right));
var hspd = (keyboard_check(global.key_right)-keyboard_check(global.key_left))*playerMovespeed;
var vspd = (keyboard_check(global.key_down)-keyboard_check(global.key_up))*playerMovespeed;
//calculate facing direction

/*
Bug:
You need to press move key before pressing attack or it complains
*/
//The code below uses player direction to determine the starting and end point of sword
//and movement speed vector
//right
if (hspd > 0 and vspd == 0) {
    facing_dir = 0;
    swordx=30;
    swordy=-30;
    swordendx=60;
    swordendy=-30;
    swordmvx=0;
    swordmvy=1;
}
//up
if (vspd < 0 and hspd == 0) {
    facing_dir = 1;
    swordx=-30;
    swordy=-30;
    swordendx=-30;
    swordendy=-60;
    swordmvx=1;
    swordmvy=0;
}
//left
if (hspd < 0 and vspd == 0) {
    facing_dir = 2;
    swordx=-30;
    swordy=30;
    swordendx=-60;
    swordendy=30;
    swordmvx=0;
    swordmvy=-1;
}
//down
if (vspd > 0 and hspd == 0) {
    facing_dir = 3;
    swordx=30;
    swordy=30;
    swordendx=30;
    swordendy=60;
    swordmvx=-1;
    swordmvy=0;
}


//handle attack
if (keyboard_check( global.key_attack )) {
    image_speed=1;
    //image_index=1;
    obj_player_animed.attackframe = 1;
    show_debug_message("J pressed \n");
}

//handle attack collision
if(obj_player_animed.attackframe != 0){
    swordx1=x+swordx+swordmvx*10*(obj_player_animed.attackframe-1);
    swordy1=y+swordy+swordmvy*10*(obj_player_animed.attackframe-1);
    swordx2=x+swordendx+swordmvx*10*(obj_player_animed.attackframe-1);
    swordy2=y+swordendy+swordmvy*10*(obj_player_animed.attackframe-1);
    //check collision
    if(collision_line(swordx1,swordy1,swordx2,swordy2,obj_slime_obstacle,false,true)){
    //collision handling code
        show_debug_message("Sword hit slime\n");
    }
    obj_player_animed.attackframe++;
    if(obj_player_animed.attackframe == 7){
        obj_player_animed.attackframe = 0;
    }
}
script_execute(scr_character_move, hspd, vspd); 
    



