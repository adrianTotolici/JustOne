if (global.new_game){
	room_restart();
}
enum PLAYER_STATE {
	CONTROLS,
	HARVEST,
	INVENTORY,
	ATTACK,
	SLEEP
}

enum TOOL_TYPE {
	ROCK,
	STICK,
	MUG,
	AXE,
	WEAPON,
	PICKAXE
}

enum EQUIPMENT_TYPE {
	STRAW_ARMOR,
	STRAW_HAT,
	STRAW_PANTS,
	STRAW_FOOTWARE,
	STRAW_GLOVES,
	BARK_ARMOR,
	BARK_HAT,
	BARK_PANTS,
	BARK_FOOTWARE,
	BARK_GLOVES
}

audio_play_sound(snd_background_birdsong, 1, true);


if (global.full_screen) {
	// Enable borderless fullscreen
	window_enable_borderless_fullscreen(true);

	// Set the window to fullscreen
	window_set_fullscreen(true);

	view_wport[0] = window_get_width();
	view_hport[0] = window_get_height();
	camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);
}