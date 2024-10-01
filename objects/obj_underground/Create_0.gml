/// @description Insert description here
global.back_layer_underground=layer_create(-1);
global.back_tiles_underground = layer_tilemap_create(global.back_layer_underground, 0, 0,ts_underground , room_width,room_height);

depth=obj_you.depth+3;

var _freq_nr=20
var _ran_data=0;
var _sprite_size=64;
var _x_sprites=room_width div _sprite_size;
var _y_sprites=room_height div _sprite_size;

global.resource_matrix_underground= [];
for (a=0;a<_x_sprites;a++){
	global.resource_matrix_underground[a] = array_create(_y_sprites,false);
}

_player=obj_you;
tile_x=_player.x div 64;
tile_y=_player.y div 64;
	
tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x,_player.y-32);
tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x-64,_player.y-32);
tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x+64,_player.y-32);
tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x,_player.y-32+64);
tilemap_set_at_pixel(global.back_tiles_underground,1,_player.x,_player.y-32-64);
