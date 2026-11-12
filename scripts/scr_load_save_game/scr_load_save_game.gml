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
				global.loaded_save = _save_data;
				global.pending_world_seed = _save_data.world.seed;
				global.back_tiles = noone;
				room_goto(rm_world);
			}
		}
	}

}

function scr_build_save_data(_player, _ui) {
    var _saved_inventory = array_create(16, "");
    for (var _i = 0; _i < 16; _i++) {
        _saved_inventory[_i] = scr_save_object_name(_ui.inventory_list[_i]);
    }

    return {
        version: 3,
		world: {
			seed: global.world_seed
		},
        player: {
            x: _player.x,
            y: _player.y,
            hp: _player.hp,
            hunger: _player.hunger,
            thirst: _player.thirst,
            attack: _player.attack,

            equipped: scr_save_object_name(_player.equipped),
            head_equipment: scr_save_object_name(_player.head_equipment),
            body_equipment: scr_save_object_name(_player.body_equipment),
            leg_equipment: scr_save_object_name(_player.leg_equipment),
            left_foot_equipment: scr_save_object_name(_player.left_foot_equipment),
            right_foot_equipment: scr_save_object_name(_player.right_foot_equipment),

            inventory_list: _saved_inventory,
            inventory_num: _ui.inventory_num,
            inventory_equiped: _ui.inventory_equiped
        }
    };
}

function scr_parse_save_data(_json_string) {
    if (string_length(string_trim(_json_string)) == 0) {
        return noone;
    }
    var _data;

    // Reject invalid JSON instead of allowing a load-time crash
    try {
        _data = json_parse(_json_string);
    } 
	catch (_error) {
        return noone;
    }

    // Validate the save structure and version
    if (!is_struct(_data)) return noone;
    if (!variable_struct_exists(_data, "version")) return noone;
    if (_data.version != 3) return noone;
	// Validate world data
	if (!variable_struct_exists(_data, "world")) return noone;
	if (!is_struct(_data.world)) return noone;
	if (!variable_struct_exists(_data.world, "seed")) return noone;
	if (!is_real(_data.world.seed)) return noone;
    if (!variable_struct_exists(_data, "player")) return noone;
    var _player = _data.player;
    if (!is_struct(_player)) return noone;
	
    // Validate required numeric player fields
    var _numeric_fields = ["x", "y", "hp", "hunger", "thirst", "attack"];
    for (var _i = 0; _i < array_length(_numeric_fields); _i++) {
        var _field = _numeric_fields[_i];

        if (!variable_struct_exists(_player, _field)) return noone;
        if (!is_real(variable_struct_get(_player, _field))) return noone;
    }

	// Validate equipment fields
	var _equipment_fields = ["equipped", "head_equipment", "body_equipment", "leg_equipment", "left_foot_equipment", "right_foot_equipment"];
	for (var _i = 0; _i < array_length(_equipment_fields); _i++) {
	    var _field = _equipment_fields[_i];
	    if (!variable_struct_exists(_player, _field)) return noone;
	    if (!is_string(variable_struct_get(_player, _field))) return noone;
	}

    // Validate inventory arrays
    var _inventory_fields = ["inventory_list", "inventory_num", "inventory_equiped"];
    for (var _i = 0; _i < array_length(_inventory_fields); _i++) {
        var _field = _inventory_fields[_i];
        if (!variable_struct_exists(_player, _field)) return noone;
        if (!is_array(variable_struct_get(_player, _field))) return noone;
        if (array_length(variable_struct_get(_player, _field)) != 16) return noone;
    }

    // Validate each inventory slot
    for (var _i = 0; _i < 16; _i++) {
        if (!is_string(_player.inventory_list[_i])) return noone;
        if (!is_real(_player.inventory_num[_i])) return noone;
        if (!is_bool(_player.inventory_equiped[_i])) return noone;

        if (_player.inventory_num[_i] < 0) return noone;
    }
	
    // Convert saved object names back into object references
    for (var _i = 0; _i < 16; _i++) {
        var _item_name = _player.inventory_list[_i];
        var _item = scr_load_object_name(_item_name);

        if (_item_name != "" && _item == noone) {
            return noone;
        }

        _player.inventory_list[_i] = _item;
    }

    // Convert equipped object names
    for (var _i = 0; _i < array_length(_equipment_fields); _i++) {
        var _field = _equipment_fields[_i];
        var _name = variable_struct_get(_player, _field);
        var _object = scr_load_object_name(_name);

        if (_name != "" && _object == noone) {
            return noone;
        }

        variable_struct_set(_player, _field, _object);
    }

    // Validate basic stat ranges
    if (_player.hp < 0 || _player.hp > 100) return noone;
    if (_player.hunger < 0 || _player.hunger > 100) return noone;
    if (_player.thirst < 0 || _player.thirst > 100) return noone;

    return _data;
}

function scr_save_object_name(_object) {
    if (_object == noone) {
        return "";
    }

    if (!object_exists(_object)) {
        return "";
    }

    return object_get_name(_object);
}

function scr_load_object_name(_name) {
    if (!is_string(_name)) {
        return noone;
    }

    if (_name == "") {
        return noone;
    }

    var _object = asset_get_index(_name);

    if (_object == -1 || !object_exists(_object)) {
        return noone;
    }

    return _object;
}
