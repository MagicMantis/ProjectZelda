//generate a forest dungeon

playerGenerated = false;

for (xx = 0; xx < 5; xx++) {
    for (yy = 0; yy < 5; yy++) {
        if (irandom(4) == 0 and !playerGenerated) {
            instance_create(xx*1024,yy*1024,obj_forest_start_room);
            playerGenerated = true;
        }
        else {
            instance_create(xx*1024,yy*1024,obj_forest_four_way);
        }
    }
}
