if(!in_view) {
	// show_debug_message("here at: {0} {1}", x, y);
	
	// Spawn lava bottom
	instance_create_layer(
		x,
		y + sprite_height,
		"LavaLayer",
		oLavaBottom
	);
	
	// To prevent infinite loop
	in_view = true;
}