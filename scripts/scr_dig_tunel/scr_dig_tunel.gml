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
				rotation_state=tile_get_rotate(tile_data)
				if (tile_data==tile_set_index(ts_underground, 2)){
					audio_stop_all();
					room_goto(rm_world);
				}
				if ((_player.equipped==obj_stone_pickaxe) && (tile_data!=tile_set_index(ts_underground,2) || tile_data!=tile_set_index(ts_underground,1))){
					
					draw_tunel(mouse_x, mouse_y,tile_data,rotation_state);
				}
			}
		}
	}
}

function draw_tunel(_mx, _my, _dig_data,_rotation_state,tiles,tilesr){
	_player=obj_you;
	scr_place_tile(0,1,_mx,_my);
	
	tiles=obj_underground.tiles;
	tilesr=obj_underground.tiles_r;
	n_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx,_my-64);
	nww_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my-64);
	w_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my);
	s_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx,_my+64);
	sww_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my+64);
	
	switch (_dig_data){
		case tiles[2]:
			switch (n_tile){
				case tiles[6]:
					scr_place_tile(1,3,_mx,_my-64);
					break;
				case tiles[2]:
					scr_place_tile(0,4,_mx,_my-64);
					break;
				case tilesr[8]:
					scr_place_tile(1,10,_mx,_my-64);
					break;
				case tilesr[11]:
					scr_place_tile(0,4,_mx,_my-64);
					break;
				case tiles[14]:
					scr_place_tile(0,17,_mx,_my-64);
					break;
				case tiles[15]:
					scr_place_tile(0,14,_mx,_my-64);
					break;
				default:
					show_debug_message("dig 3 North case");
					break;
			}
			switch (w_tile){
				case 0:
					scr_place_tile(0,3,_mx-64,_my);
					break;
				case tilesr[6]:
					scr_place_tile(1,12,_mx-64,_my);
					break;
				case tiles[7]:
					scr_place_tile(0,14,_mx-64,_my);
					break;
				case tiles[10]:
					scr_place_tile(0,15,_mx-64,_my);
					break;
				default:
					show_debug_message("dig 3 West case");
					break;
			}
			switch (s_tile){
				case tiles[3]:
					scr_place_tile(1,10,_mx,_my+64);
					break;
				case tilesr[10]:
					scr_place_tile(1,8,_mx,_my+64);
					break;
				case tilesr[11]:
					scr_place_tile(1,18,_mx,_my+64);
					break;
				case tilesr[14]:
					scr_place_tile(0,14,_mx,_my+64);
					break;
				default:
					show_debug_message("dig 3 South case");
					break;
			}
			switch (sww_tile){
				case 0:
					scr_place_tile(0,7,_mx-64,_my-64);
					break;
				default:
					break;
			}
			switch (nww_tile){
				case 0:
					scr_place_tile(1,11,_mx-64,_my+64);
					break;
				default:
					break;
			}
			break;
		case tiles[3]:
			switch (n_tile){
				case tiles[2]:
					scr_place_tile(0,4,_mx,_my-64);
					break;
				case tiles[6]:
					scr_place_tile(1,3,_mx,_my-64);
					break;
				case tilesr[11]:
					scr_place_tile(1,14,_mx,_my-64);
					break;
				case tilesr[14]:
					scr_place_tile(0,17,_mx,_my-64);
					break;
				default:
					show_debug_message("dig 4 North case");
					break;
			}
			switch (w_tile){
				case tilesr[2]:
					scr_place_tile(0,4,_mx-64,_my);
					break;
				case tilesr[3]:
					scr_place_tile(0,5,_mx-64,_my);
					break;
				case tiles[15]:
					scr_place_tile(0,14,_mx-64,_my);
					break;
				case tiles[6]:
					scr_place_tile(0,3,_mx-64,_my);
					break;
				case tilesr[12]:
					scr_place_tile(0,17,_mx-64,_my);
					break;
				default:
					show_debug_message("dig 4 West case");
					break;
			}
		case tiles[4]:
			switch (n_tile){
				case tiles[15]:
					scr_place_tile(1,4,_mx,_my-64);
					break;
				case tiles[9]:
					scr_place_tile(0,6,_mx,_my-64);
					break;
				case tiles[17]:
					scr_place_tile(1,5,_mx,_my-64);
					break;
				case tilesr[11]:
					scr_place_tile(0,4,_mx,_my-64);
					break;
				case tilesr[17]:
					scr_place_tile(1,10,_mx,_my-64);
					break;
				default:
					show_debug_message("dig 5 North case");
					break;
			}
		
		default:
			break;
			
	}
}