//generate a forest dungeon

playerGenerated = false;

for (xx = 0; xx < 5; xx++) {
    for (yy = 0; yy < 5; yy++) {
        switch (irandom(6)) {
            case 0:
                if (!playerGenerated) {
                    instance_create(xx*1024,yy*1024,obj_forest_start_room);
                    playerGenerated = true;
                }
                else {
                    instance_create(xx*1024,yy*1024,obj_forest_four_way);
                }
                break;
            case 1:
                instance_create(xx*1024,yy*1024,obj_forest_top_right);
                break;
            case 2:
                instance_create(xx*1024,yy*1024,obj_forest_top_right);
                break;
            case 3:
                instance_create(xx*1024,yy*1024,obj_forest_top_right);
                break;
            case 4:
                instance_create(xx*1024,yy*1024,obj_forest_top_right);
                break;
            default:
                instance_create(xx*1024,yy*1024,obj_forest_four_way);
        }
    }
}
