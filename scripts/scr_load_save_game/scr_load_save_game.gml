// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_save_game(){
	if (room==rm_world || room==rm_world_u1){
		var save_data = {
		world_tiles: global.back_tiles,
		};
		var json_string = json_stringify(save_data);
		var file = file_text_open_write("savefile.txt");
		file_text_write_string(file, json_string);
		file_text_close(file);
	}
	
	if (room==rm_menu){
		if (file_exists("savefile.txt")){
			var file = file_text_open_read("savefile.txt");
			var json_string = file_text_read_string(file);
			var save_data = json_parse(json_string);
			file_text_close(file);

			global.back_tiles=save_data.world_tiles;
			room_goto(rm_world);
		}
	}

}