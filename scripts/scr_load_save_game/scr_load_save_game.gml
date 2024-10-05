// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_save_game(){
	if (room==rm_world || room==rm_world_u1){
		var _save_data = {
		world_tiles: global.back_tiles,
		player: obj_you,
		};
		var _json_string = json_stringify(_save_data);
		var _file = file_text_open_write("savefile.txt");
		file_text_write_string(_file, _json_string);
		file_text_close(_file);
	}
	
	if (room==rm_menu){
		if (file_exists("savefile.txt")){
			var _file = file_text_open_read("savefile.txt");
			var _json_string = file_text_read_string(_file);
			var _save_data = json_parse(_json_string);
			file_text_close(_file);

			global.back_tiles=_save_data.world_tiles;
			
			room_goto(rm_world);
		}
	}

}