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
			audio_stop_all();
			room_goto(rm_world_u1);
		}else{
			if (room == rm_world_u1){
				tile_data=tilemap_get_at_pixel(global.back_tiles_underground,mouse_x,mouse_y);
				if (tile_data==tile_set_index(ts_underground, 2)){
					audio_stop_all();
					room_goto(rm_world);
				}
				if ((_player.equipped==obj_stone_pickaxe) && (tile_data==0)){
					draw_tunel(mouse_x,mouse_y);
				}
				//if (tile_data==tile_set_index(ts_underground,3)){
				//	draw_tunel_direction(mouse_x, mouse_y, tile_data);
				//}
			}
		}
	}
}

function draw_tunel(mx, my){
	_player=obj_you;
	
	tile_data_NE=tilemap_get_at_pixel(global.back_tiles_underground, mx-64, my-64);
	tile_data_N=tilemap_get_at_pixel(global.back_tiles_underground, mx, my-64);
	tile_data_NW=tilemap_get_at_pixel(global.back_tiles_underground, mx+64, my-64);
	
	tile_data_E=tilemap_get_at_pixel(global.back_tiles_underground, mx-64, my);
	tile_data_W=tilemap_get_at_pixel(global.back_tiles_underground, mx+64, my);
	
	tile_data_SE=tilemap_get_at_pixel(global.back_tiles_underground, mx+64, my+64);
	tile_data_S=tilemap_get_at_pixel(global.back_tiles_underground, mx, my+64);
	tile_data_SW=tilemap_get_at_pixel(global.back_tiles_underground, mx-64, my+64);
	
	if (tile_data_E == 0){
		if (tile_data_N == 8){
			if  (tile_data_S == 8){
				if (tile_data_W == 4){
					
				}
			}
		}
	}
	
	tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x,_player.y);

}