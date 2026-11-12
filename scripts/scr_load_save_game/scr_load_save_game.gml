// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_load_save_game(){
	if (room==rm_world || room==rm_world_u1){
		var _save_data=scr_build_save_data(obj_you,obj_ui);
		var _json_string = json_stringify(_save_data);
		var _file = file_text_open_write("savefile.txt");
		if (_file != -1){
			file_text_write_string(_file, _json_string);
			file_text_close(_file);
		}
	}
	
	if (room==rm_menu){
		if (file_exists("savefile.txt")){
			var _file = file_text_open_read("savefile.txt");
			var _json_string = file_text_read_string(_file);
			var _save_data=scr_parse_save_data(_json_string);
			file_text_close(_file);

			if (_save_data!=noone){
				global.loaded_save=_save_data;
				global.back_tiles=noone;
				room_goto(rm_world);
			}
		}
	}

}

function scr_build_save_data(_player,_ui){
	return {
		version: 1,
		player: {
			x: _player.x,
			y: _player.y,
			hp: _player.hp,
			hunger: _player.hunger,
			thirst: _player.thirst,
			attack: _player.attack,
			equipped: _player.equipped,
			head_equipment: _player.head_equipment,
			body_equipment: _player.body_equipment,
			leg_equipment: _player.leg_equipment,
			left_foot_equipment: _player.left_foot_equipment,
			right_foot_equipment: _player.right_foot_equipment,
			inventory_list: _ui.inventory_list,
			inventory_num: _ui.inventory_num,
			inventory_equiped: _ui.inventory_equiped,
		},
	};
}

function scr_parse_save_data(_json_string){
	if (string_length(string_trim(_json_string))==0) return noone;
	var _data=json_parse(_json_string);
	if (!is_struct(_data) || !variable_struct_exists(_data,"player")) return noone;
	return _data;
}
