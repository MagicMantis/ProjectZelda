//do things at the start of the game

show_debug_message("Begin initialization\n");

//seed
randomize();

//keybindings
global.key_up = ord('W');
global.key_right = ord('D');
global.key_left = ord('A');
global.key_down = ord('S');
global.key_attack = ord('J');
global.key_use = ord('E');

//game data
global.dungeon_floor = 0;

show_debug_message("End initialization\n");

