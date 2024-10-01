// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dig_tunel(){
	if (keyboard_check_released(vk_space)){
		var _player=obj_you;
		if (_player.equipped!=noone && _player.equipped==obj_stone_pickaxe){
			tile_x=_player.x div 64;
			tile_y=_player.y div 64;
			if (global.resource_matrix[tile_x][tile_y]==false){
				instance_create_layer(_player.x,_player.y,"Instances", obj_whole);
				for (i=0; i<random_range(2,6); i++){
					instance_create_layer(_player.x,_player.y,"Instances", obj_mud_loot);
				}
				global.resource_matrix[tile_x][tile_y]=true;
			}
		}
	}
	
	if (mouse_check_button_released(mb_left)){
		var _resources = instance_position(mouse_x, mouse_y, obj_whole);
		var _player = obj_you;
		
		x_min=obj_you.x-50;
		x_max=obj_you.x+50;
		
		y_min=obj_you.y-50;
		y_max=obj_you.y+50;
		
		if (instance_exists(_resources) && (x_min<=_resources.x && _resources.x<=x_max) && (y_min<=_resources.y && _resources.y<=y_max) && _resources!=_player){
			room_goto(rm_world_u1);
		}
	}
}

function draw_tunel(){
	_player=obj_you;
	tile_x=_player.x div 64;
	tile_y=_player.y div 64;
	
	tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x,_player.y);

}