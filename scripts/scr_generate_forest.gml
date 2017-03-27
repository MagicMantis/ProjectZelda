//generate a forest dungeon

var maxRooms = argument0
var maxWidth = argument1
var maxHeight = argument2
var playerGenerated = false;

var roomCount = 0
var doorCount = 0

var layout = ds_grid_create(maxWidth,maxHeight)
ds_grid_clear(layout, 0)

var queue = ds_queue_create();

var startX = irandom_range(1,maxWidth-2);
var startY = irandom_range(1,maxHeight-2);
switch (irandom(4)) {
    case 0:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_right);
        ds_queue_enqueue(queue, startX+1, startY);
        break;
    case 1:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_left);
        ds_queue_enqueue(queue, startX-1, startY);
        break;
    case 2:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_top);
        ds_queue_enqueue(queue, startX, startY+1);
        break;
    case 3:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_bottom);
        ds_queue_enqueue(queue, startX, startY-1);
        break;
    default:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_right);
        ds_queue_enqueue(queue, startX+1, startY);
}
layout[startX, startY] = 1;

while (roomCount < maxRooms and doorCount > 0) {
    
}
//old version
/*
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
}*/
