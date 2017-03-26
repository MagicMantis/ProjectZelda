if (instance_exists(obj_player)) {
    player = instance_find(obj_player, 0);
    view_xview = floor(player.x / 1024) * 1024;
    view_yview = floor(player.y / 1024) * 1024;
    //view_xview = player.x - view_wview / 2;
    //view_yview = player.y - view_hview / 2;
}
