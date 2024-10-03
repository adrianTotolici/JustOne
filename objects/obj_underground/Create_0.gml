/// @description Insert description here
global.back_layer_underground=layer_create(-1);
global.back_tiles_underground = layer_tilemap_create(global.back_layer_underground, 0, 0,ts_underground , room_width,room_height);

depth=obj_you.depth+3;
sound_playing=false;
sound_play=false;

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
	

scr_place_tile(0,2,_player.x,_player.y-32);

//NW 
scr_place_tile(0,7,_player.x-64,_player.y-32-64);
//N
scr_place_tile(1,3,_player.x,_player.y-32-64); 
//NE
scr_place_tile(1,7,_player.x+64,_player.y-32-64);

//E
scr_place_tile(0,3,_player.x-64,_player.y-32);

//W
scr_place_tile(0,8,_player.x+64,_player.y-32);

//SE 
scr_place_tile(1,11,_player.x-64,_player.y-32+64);

//S
scr_place_tile(1,8,_player.x,_player.y-32+64);

//SW
scr_place_tile(0,11,_player.x+64,_player.y-32+64);
