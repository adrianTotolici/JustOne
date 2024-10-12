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

function draw_tunel(_mx, _my, _dig_data,_rotation_state){
	_player=obj_you;
	scr_place_tile(0,1,_mx,_my);
	_sprite_size=64;
	
	tiles=obj_underground.tiles;
	tilesr=obj_underground.tiles_r;
	n_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx,_my-64);
	w_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my);
	e_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx+64,_my);
	s_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx,_my+64);
	nw_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my-64);
	ne_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx+64,_my-64);
	sw_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx-64,_my+64);
	se_tile=tilemap_get_at_pixel(global.back_tiles_underground,_mx+64,_my+64);
	
	//N1
	if (_dig_data==tilesr[2] || _dig_data==tiles[6] || _dig_data==tilesr[6] || _dig_data==0){
		switch (n_tile){
			case tilesr[7]:
				scr_place_tile(1,14,_mx,_my-_sprite_size);
				break;
			case tiles[10]:
				scr_place_tile(0,13,_mx,_my-_sprite_size);
				break;
			case tilesr[10]:
				scr_place_tile(1,15,_mx,_my-_sprite_size);
				break;
			case 0:
				scr_place_tile(1,3,_mx,_my-_sprite_size);
				break;
			default:
				break;
		}
		switch (ne_tile){
			case 0:
				scr_place_tile(1,7,_mx+64,_my-64);
				break;
			case tiles[6]:
				scr_place_tile(1,12,_mx+64,_my-64);
				break;
			case tiles[2]:
				scr_place_tile(1,12,_mx+64,_my-64);
				break;
			default:
				break;
		}
		switch (e_tile){
			case tilesr[2]:
				scr_place_tile(1,4,_mx+64,_my);
				break;
			default:
				break;
		}
		if (nw_tile==0){
			scr_place_tile(0,7,_mx-64,_my-64);
		}
		
	}
	//N2	
	if (_dig_data==tilesr[3] || _dig_data==tiles[15] || _dig_data==tiles[7] || _dig_data==tiles[10] || _dig_data==tiles[12]){
		switch(n_tile){
			case tilesr[15]:
				scr_place_tile(1,14,_mx,_my-_sprite_size);
				break;
			case tilesr[6]:
				scr_place_tile(1,3,_mx,_my-_sprite_size);
				break;
			case tiles[7]:
				scr_place_tile(1,4,_mx,_my-_sprite_size);
				break;
			case tiles[8]:
				scr_place_tile(1,5,_mx,_my-_sprite_size);
				break;
			case tilesr[12]:
				scr_place_tile(1,17,_mx,_my-_sprite_size);
				break;
			default:
				break;
		}
		if (ne_tile==0){
			scr_place_tile(0,7,_mx+64,_my-64);
		}
	}
	//N3
	if (_dig_data==tiles[3] || _dig_data==tiles[2] || _dig_data==tilesr[14] || _dig_data==tilesr[10]){
		switch(n_tile){
			case tiles[6]:
				scr_place_tile(1,3,_mx,_my-_sprite_size);
				break;
			case tiles[2]:
				scr_place_tile(0,4,_mx,_my-_sprite_size);
				break;
			case tilesr[8]:
				scr_place_tile(1,10,_mx,_my-_sprite_size);
				break;
			case tilesr[11]:
				scr_place_tile(0,4,_mx,_my-_sprite_size);
				break;
			case tiles[14]:
				scr_place_tile(0,17,_mx,_my-_sprite_size);
				break;
			case tiles[15]:
				scr_place_tile(0,14,_mx,_my-_sprite_size);
				break;
			default:
				break;
		}
		if (nw_tile==0){
			scr_place_tile(1,7,_mx-64,_my-64);
		}
	}
	//N4	
	if (_dig_data==tiles[4] || _dig_data==tiles[13] || _dig_data==tilesr[16] || _dig_data==tilesr[12] || _dig_data==tiles[14] || _dig_data==tiles[16]){
		switch(n_tile){
			case tiles[15]:
				scr_place_tile(1,4,_mx,_my-_sprite_size);
				break;
			case tiles[9]:
				scr_place_tile(0,6,_mx,_my-_sprite_size);
				break;
			case tiles[17]:
				scr_place_tile(1,5,_mx,_my-_sprite_size);
				break;
			case tilesr[11]:
				scr_place_tile(0,4,_mx,_my-_sprite_size);
				break;
			case tilesr[17]:
				scr_place_tile(1,10,_mx,_my-_sprite_size);
				break;
			default:
				break;
		}
	}
	//W1	
	if (_dig_data==tiles[2] || _dig_data==tiles[6] || _dig_data==tilesr[10] || _dig_data==0){
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
				break;
		}
		
		if (sw_tile==0){
			scr_place_tile(1,11,_mx-64,_my+64);
		}
		if (nw_tile==0){
			scr_place_tile(0,7,_mx-64,_my-64);
		}
		if (s_tile==tiles[2]){
			scr_place_tile(1,9,_mx,_my+64);
		}
	}
	//W2	
	if (_dig_data==tilesr[2] || _dig_data==tiles[3] || _dig_data==tilesr[6] || _dig_data==tilesr[14] || _dig_data==tilesr[11]){
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
			case tiles[12]:
				scr_place_tile(0,17,_mx-64,_my);
				break;
			case tiles[6]:
				scr_place_tile(0,3,_mx-64,_my);
				break;
			default:
				break;
		}
		
		if (nw_tile==0){
			scr_place_tile(0,7,_mx-64,_my-64);
		}
	}
	//W3
	if(_dig_data==tilesr[8] || _dig_data==tiles[10] || _dig_data==tiles[11] || _dig_data==tiles[14]){
		switch (w_tile){
			case tilesr[15]:
				scr_place_tile(1,18,_mx-64,_my-64);
				break;
			case tilesr[7]:
				scr_place_tile(1,9,_mx-64,_my-64);
				break;
			case tiles[8]:
				scr_place_tile(0,10,_mx-64,_my-64);
				break;
			case tilesr[10]:
				scr_place_tile(0,3,_mx-64,_my-64);
				break;
			case tilesr[12]:
				scr_place_tile(0,14,_mx-64,_my-64);
				break;
			default:
				break;
		}
		if (sw_tile==0){
			scr_place_tile(1,11,_mx-64,_my+64);
		}
	}
	//W4	
	if (_dig_data==tilesr[13] || _dig_data==tilesr[15] || _dig_data==tilesr[9] || _dig_data==tiles[16] || _dig_data==tilesr[17]){
		switch(w_tile){
			case tilesr[4]:
				scr_place_tile(0,6,_mx-64,_my-64);
				break;
			case tilesr[13]:
				scr_place_tile(1,10,_mx-64,_my-64);
				break;
			case tilesr[14]:
				scr_place_tile(0,4,_mx-64,_my-64);
				break;
			case tilesr[16]:
				scr_place_tile(0,5,_mx-64,_my-64);
				break;
			case tiles[17]:
				scr_place_tile(0,10,_mx-64,_my-64);
				break;
			case tiles[11]:
				scr_place_tile(1,9,_mx-64,_my-64);
				break;
			default:
				break;
		}
	}
	//E1
	if (_dig_data==tilesr[6] || _dig_data==tiles[7] || _dig_data==tiles[10] || _dig_data==0){
		switch(e_tile){
			case tiles[2]:
				scr_place_tile(0,14,_mx+64,_my);
				break;
			case tiles[6]:
				scr_place_tile(0,16,_mx+64,_my);
				break;
			case tilesr[10]:
				scr_place_tile(1,13,_mx+64,_my);
				break;
			case 0:
				scr_place_tile(0,8,_mx+64,_my);
				break;
			case tilesr[8]:
				scr_place_tile(0,10,_mx+64,_my);
				break;
			case tiles[10]:
				scr_place_tile(0,8,_mx+64,_my);
				break;
			case tiles[11]:
				scr_place_tile(0,18,_mx+64,_my);
				break;
			case tiles[14]:
				scr_place_tile(0,14,_mx+64,_my);
				break;
			default:
				break;
		}
		switch (ne_tile){
			case 0:
				scr_place_tile(1,7,_mx+64,_my-64);
				break;
			case tiles[2]:
				scr_place_tile(1,12,_mx+64,_my-64);
				break;
			default:
				break;
		}
		switch (se_tile){
			case 0:
				scr_place_tile(0,11,_mx+64,_my+64);
				break;
			case tiles[2]:
				scr_place_tile(0,15,_mx+64,_my+64);
				break;
			default:
				break;
		}
	}
	//E2	
	if (_dig_data==tilesr[2] || _dig_data==tilesr[3] || _dig_data==tiles[15] || _dig_data==tiles[6] || _dig_data==tiles[12]){
		switch(e_tile){
			case tiles[3]:
				scr_place_tile(0,5,_mx+64,_my);
				break;
			case tilesr[14]:
				scr_place_tile(1,17,_mx+64,_my);
				break;
			case tilesr[11]:
				scr_place_tile(0,14,_mx+64,_my);
				break;
			case tilesr[6]:
				scr_place_tile(0,8,_mx+64,_my);
				break;
			default:
				break;
		}
		if (ne_tile==0){
			scr_place_tile(1,7,_mx+64,_my-64);
		}
	}
	//E3	
	if (_dig_data==tilesr[15] || _dig_data==tilesr[7] || _dig_data==tiles[8] || _dig_data==tilesr[10] || _dig_data==tilesr[12]){
		switch(e_tile){
			case tilesr[7]:
				scr_place_tile(0,9,_mx+64,_my);
				break;
			case tilesr[8]:
				scr_place_tile(0,10,_mx+64,_my);
				break;
			case tiles[10]:
				scr_place_tile(0,8,_mx+64,_my);
				break;
			case tiles[11]:
				scr_place_tile(0,18,_mx+64,_my);
				break;
			case tiles[14]:
				scr_place_tile(0,14,_mx+64,_my);
				break;
			default:
				break;
		}
		if (se_tile==0){
			scr_place_tile(0,11,_mx+64,_my+64)
		}
	}
	//E4
	if (_dig_data==tilesr[4] || _dig_data==tilesr[13] || _dig_data==tilesr[14] || _dig_data==tilesr[16] || _dig_data==tiles[17] || _dig_data==tiles[11]){
		switch(e_tile){
			case tilesr[13]:
				scr_place_tile(1,5,_mx+64,_my);
				break;
			case tilesr[15]:
				scr_place_tile(0,9,_mx+64,_my);
				break;
			case tilesr[9]:
				scr_place_tile(0,6,_mx+64,_my);
				break;
			case tiles[12]:
				scr_place_tile(1,4,_mx+64,_my);
				break;
			case tiles[16]:
				scr_place_tile(0,5,_mx+64,_my);
				break;
			default:
				break;
		}
	}
	//S1
	if (_dig_data==tilesr[7] || _dig_data==tiles[10] || _dig_data==tilesr[10] || _dig_data==0){
		switch (s_tile){
			case tilesr[2]:
				scr_place_tile(1,14,_mx,_my+64);
				break;
			case tiles[6]:
				scr_place_tile(0,12,_mx,_my+64);
				break;
			case tilesr[6]:
				scr_place_tile(1,16,_mx,_my+64);
				break;
			case 0:
				scr_place_tile(1,8,_mx,_my+64);
				break;
			default:
				break;
		}
		switch (w_tile){
			case tilesr[10]:
				scr_place_tile(0,3,_mx-64,_my);
				break;
			case tilesr[7]:
				scr_place_tile(1,9,_mx-64,_my);
				break;
			default:
				break;
		}
		
		if (sw_tile==0){
			scr_place_tile(1,11,_mx-64,_my+64);
		}
		if (se_tile==0){
			scr_place_tile(0,11,_mx+64,_my+64);
		}
	}
	//S2
	if (_dig_data==tiles[2] || _dig_data==tiles[6] || _dig_data==tilesr[8] || _dig_data==tiles[11] || _dig_data==tiles[14]){
		switch(s_tile){
			case tiles[3]:
				scr_place_tile(1,10,_mx,_my+64);
				break;
			case tilesr[14]:
				scr_place_tile(1,14,_mx,_my+64);
				break;
			case tilesr[10]:
				scr_place_tile(1,8,_mx,_my+64);
				break;
			case tilesr[11]:
				scr_place_tile(1,18,_mx,_my+64);
				break;
			default:
				break;
		}
		
		if (sw_tile){
			scr_place_tile(1,11,_mx-64,_my+64);
		}
	}
	//S3
	if (_dig_data==tilesr[15] || _dig_data==tilesr[6] || _dig_data==tiles[7] || _dig_data==tiles[8]){
		switch(s_tile){
			case tilesr[3]:
				scr_place_tile(0,10,_mx,_my+64);
				break;
			case tiles[15]:
				scr_place_tile(0,18,_mx,_my+64);
				break;
			case tiles[7]:
				scr_place_tile(0,9,_mx,_my+64);
				break;
			case tiles[10]:
				scr_place_tile(1,8,_mx,_my+64);
				break;
			case tiles[12]:
				scr_place_tile(1,14,_mx,_my+64);
				break;
			default:
				break;
		}
		
		if(se_tile){
			scr_place_tile(0,11,_mx+64,_my+64);
		}
	}
	//S4
	if (_dig_data==tiles[15] || _dig_data==tiles[9] || _dig_data==tiles[13] || _dig_data==tiles[17] || _dig_data==tilesr[11] || _dig_data==tilesr[17]){
		switch(s_tile){
			case tiles[4]:
				scr_place_tile(0,6,_mx,_my+64);
				break;
			case tiles[13]:
				scr_place_tile(0,10,_mx,_my+64);
				break;
			case tilesr[16]:
				scr_place_tile(1,5,_mx,_my+64);
				break;
			case tilesr[12]:
				scr_place_tile(0,9,_mx,_my+64);
				break;
			case tiles[14]:
				scr_place_tile(1,9,_mx,_my+64);
				break;
			case tiles[16]:
				scr_place_tile(1,10,_mx,_my+64);
				break;
			default:
				break;
		}
	}
}