move_speed = jump_distance / jump_speed

if (jumping) {
	//calculate movement vectors
	player = instance_find(obj_player, n)
	x_dist = player.x - x
	y_dist = player.y - y
	total_dist = x_dist + y_dist

	x_speed = (x_dist/total_dist) * move_speed;
	y_speed = (y_dist/total_dist) * move_speed;	
	
	//manage jump length
	jump_steps += 1
	if (jump_steps == 30) {
		jump_steps = 0
		jumping = false
	}
}
else if (jump_cooldown > 0) {
	jump_cooldown -= 1
	if (jump_cooldown == 0) {
		jumping = true
		jump_cooldown = 100
	}
}
