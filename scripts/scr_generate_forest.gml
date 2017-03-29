//generate a forest dungeon

randomize()
seed = irandom(1000000);
random_set_seed(340264);
//random_set_seed(seed);
show_debug_message("Seed: "+string(seed));


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
var layout = ds_grid_create(maxWidth,maxHeight);
ds_grid_clear(layout, 0);

var queue = ds_queue_create();

var startX = irandom_range(1,maxWidth-2);
var startY = irandom_range(1,maxHeight-2);
ds_grid_set(layout,startX, startY, 0);
switch (irandom(4)) {
    case 0:
        instance_create(startX*1024,startY*1024,obj_forest_start_room_left);
        ds_queue_enqueue(queue, startX+1, startY);
        ds_grid_set(layout,startX, startY, 1)
        break;
    case 1:
        instance_create(startX*1024,startY*1024,obj_forest_start_room_right);
        ds_queue_enqueue(queue, startX-1, startY);
        ds_grid_set(layout,startX, startY, 4)
        break;
    case 2:
        instance_create(startX*1024,startY*1024,obj_forest_start_room_top);
        ds_queue_enqueue(queue, startX, startY+1);
        ds_grid_set(layout,startX, startY, 2)
        break;
    case 3:
        instance_create(startX*1024,startY*1024,obj_forest_start_room_bottom);
        ds_queue_enqueue(queue, startX, startY-1);
        ds_grid_set(layout,startX, startY, 8)
        break;
    default:
        instance_create(startX*1024,startY*1024,obj_forest_start_room_left);
        ds_queue_enqueue(queue, startX+1, startY);
        ds_grid_set(layout,startX, startY, 1)
}


var roomsCreated = 1
while (!ds_queue_empty(queue)) {
    roomsRemaining = maxRooms - (ds_queue_size(queue)/2) - roomsCreated;
    //if (roomsRemaining < 0) {
        show_debug_message(ds_queue_size(queue));
    //}
    var x_loc = ds_queue_dequeue(queue);
    var y_loc = ds_queue_dequeue(queue);
    if (ds_grid_get(layout, x_loc, y_loc) == -1)
            ds_grid_set(layout,x_loc,y_loc, 0);
    if (ds_grid_get(layout, x_loc, y_loc) != 0) continue;
    //check if door to left is manditory
    if (x_loc > 0) {
        if (ds_grid_get(layout,x_loc-1,y_loc) & 1 > 0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 4));
        }
        else if (ds_grid_get(layout,x_loc-1,y_loc) == 0 and random(sqrt(roomsRemaining)) > 1.0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 4));
            ds_queue_enqueue(queue, x_loc-1, y_loc);
            ds_grid_set(layout,x_loc-1,y_loc, 0);
        }
    }
    //check if door to top is manditory
    if (y_loc > 0) {
        if (ds_grid_get(layout,x_loc,y_loc-1) & 2 > 0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 8));
        }
        else if (ds_grid_get(layout,x_loc,y_loc-1) == 0 and random(sqrt(roomsRemaining)) > 1.0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 8));
            ds_queue_enqueue(queue, x_loc, y_loc-1);
            ds_grid_set(layout,x_loc,y_loc-1, -1);
        }
    }
    //check if door to right is manditory
    if (x_loc < maxWidth-2) {
        if (ds_grid_get(layout,x_loc+1,y_loc) & 4 > 0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 1));
        }
        else if (ds_grid_get(layout,x_loc+1,y_loc) == 0 and random(sqrt(roomsRemaining)) > 1.0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 1));
            ds_queue_enqueue(queue, x_loc+1, y_loc);
            ds_grid_set(layout,x_loc+1,y_loc, -1);
        }
    }
    //check if door to bottom is manditory
    if (y_loc < maxHeight-2) {
        if (ds_grid_get(layout,x_loc,y_loc+1) & 8 > 0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 2));
        }
        else if (ds_grid_get(layout,x_loc,y_loc+1) == 0 and random(sqrt(roomsRemaining)) > 1.0) {
            ds_grid_set(layout,x_loc,y_loc, (ds_grid_get(layout,x_loc,y_loc) | 2));
            ds_queue_enqueue(queue, x_loc, y_loc+1);
            ds_grid_set(layout,x_loc,y_loc+1, -1);
        }
    }
    roomsCreated++;
}
show_debug_message(roomsCreated);

for (xx = 0; xx < maxWidth; xx++) {
    msg = ""
    for (yy = 0; yy < maxHeight; yy++) {
        msg += string(ds_grid_get(layout,yy,xx)) + " "
        if (xx == startX and yy == startY) continue;
        switch (ds_grid_get(layout,xx,yy)) {
            case 0:
                break;
            case 1: //0001 (door right)
                instance_create(xx*1024,yy*1024,obj_forest_dead_left); break;
            case 2: //0010 (door down)
                instance_create(xx*1024,yy*1024,obj_forest_dead_top); break;
            case 3: //0011 (door down and right)
                instance_create(xx*1024,yy*1024,obj_forest_top_left); break;
            case 4: //0100 (door left)
                instance_create(xx*1024,yy*1024,obj_forest_dead_right); break;
            case 5: //0101 (door left and right)
                instance_create(xx*1024,yy*1024,obj_forest_hallway_hor); break;
            case 6: //0110 (door left and down)
                instance_create(xx*1024,yy*1024,obj_forest_top_right); break;
            case 7: //0111 (door left right and down)
                instance_create(xx*1024,yy*1024,obj_forest_three_way_top); break;
            case 8: //1000 (door up)
                instance_create(xx*1024,yy*1024,obj_forest_dead_bottom); break;
            case 9: //1001 (door up and right)
                instance_create(xx*1024,yy*1024,obj_forest_bottom_left); break;
            case 10: //1010 (door up and down)
                instance_create(xx*1024,yy*1024,obj_forest_hallway_ver); break;
            case 11: //1011 (door up right and down)
                instance_create(xx*1024,yy*1024,obj_forest_three_way_left); break;
            case 12: //1100 (door up and left)
                instance_create(xx*1024,yy*1024,obj_forest_bottom_right); break;
            case 13: //1101 (door up right and left)
                instance_create(xx*1024,yy*1024,obj_forest_three_way_bottom); break;
            case 14: //1110 (door up down and left)
                instance_create(xx*1024,yy*1024,obj_forest_three_way_right); break;
            case 15: //1111 (door up down right and left)
                instance_create(xx*1024,yy*1024,obj_forest_four_way); break;
            default:
                break;
        }
    }
    show_debug_message(msg);
}
