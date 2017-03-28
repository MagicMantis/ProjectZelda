//generate a forest dungeon

var maxRooms = argument0
var maxWidth = argument1
var maxHeight = argument2
var playerGenerated = false;

var roomCount = 0
var doorCount = 0

//uses a grid to determine layout
//grid value is bitmap as follows
//4th bit (1000) = door up
//3rd bit (0100) = door left
//2nd bit (0010) = door down
//1st bit (0001) = door right
var layout = ds_grid_create(maxWidth,maxHeight)
ds_grid_clear(layout, 0)

var queue = ds_queue_create();

var startX = irandom_range(1,maxWidth-2);
var startY = irandom_range(1,maxHeight-2);
layout[startX, startY] = 0;
switch (irandom(4)) {
    case 0:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_left);
        ds_queue_enqueue(queue, startX+1, startY);
        layout[startX, startY] = 1
        break;
    case 1:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_right);
        ds_queue_enqueue(queue, startX-1, startY);
        layout[startX, startY] = 4
        break;
    case 2:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_top);
        ds_queue_enqueue(queue, startX, startY+1);
        layout[startX, startY] = 2
        break;
    case 3:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_bottom);
        ds_queue_enqueue(queue, startX, startY-1);
        layout[startX, startY] = 8
        break;
    default:
        instance_create(xx*1024,yy*1024,obj_forest_start_room_left);
        ds_queue_enqueue(queue, startX+1, startY);
        layout[startX, startY] = 1
}

roomsCreated = 1
while (!ds_queue_empty(queue)) {
    roomsRemaining = maxRooms - ds_queue_size(queue) - roomsCreated;
    var x_loc = ds_queue_dequeue(queue);
    var y_loc = ds_queue_dequeue(queue);
    var doorTarget = irandom(min(4, roomsRemaining))+1; //random number for desired amount of doors
    var doorMin = 0; //must have at least this man doors
    //check if door to left is manditory
    if (x_loc > 0 and layout[x_loc-1,y_loc] & 1 > 0) {
        layout[x_loc,y_loc] |= 4;
        doorMin++; 
    }
    //check if door to top is manditory
    if (y_loc > 0 and layout[x_loc,y_loc-1] & 2 > 0) {
        layout[x_loc,y_loc] |= 8;
        doorMin++; 
    }
    //check if door to right is manditory
    if (x_loc < maxWidth-1 and layout[x_loc+1,y_loc] & 4 > 0) {
        layout[x_loc,y_loc] |= 1;
        doorMin++;
    }
    //check if door to bottom is manditory
    if (y_loc > 0 and layout[x_loc,y_loc+1] & 8 > 0) {
        layout[x_loc,y_loc] |= 2;
        doorMin++; 
    }
    var doorCount = max(doorMin, doorTarget)
    var doorCreate = doorCount - doorMin
    while (doorCreate > 0) {
    
    }
    
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
