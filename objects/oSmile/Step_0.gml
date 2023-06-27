// This code executes every frame

// Get player input
is_left_key_pressed = keyboard_check(vk_left) or keyboard_check(ord("A"));
is_right_key_pressed = keyboard_check(vk_right) or keyboard_check(ord("D"));
is_jump_key_pressed = keyboard_check(vk_up) or keyboard_check(vk_space) or keyboard_check(ord("W"));

// Calculate movement
var move = is_right_key_pressed - is_left_key_pressed;
hsp = move * walksp;
vsp = vsp + grv;

// Jumping
if(is_jump_key_pressed && place_meeting(x, y+1, oWall)) {
	vsp = jumpsp;
}

// Horizontal wall collision
if(place_meeting(x+hsp, y, oWall)) {
	while(!place_meeting(x+sign(hsp), y, oWall)) {
		x = x + sign(hsp);
	}
	
	hsp = 0;
}
x = x + hsp;

// Vertical wall collision
if(place_meeting(x, y+vsp, oWall)) {
	while(!place_meeting(x, y+sign(vsp), oWall)) {
		y = y + sign(vsp)
	}
	
	vsp = 0;
}
y = y + vsp;

// Lava collision
if(place_meeting(x, y-30, oLava)) {
	// Die
	game_end(0)
}