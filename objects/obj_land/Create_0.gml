/// @description Map Tile
//global.ground_layer=layer_create(-1);
//global.ground_tilemap=layer_tilemap_create(global.ground_layer,0,0,ts_grass,room_width,room_height);
//var _ground_tilemap_coast=layer_tilemap_create(global.ground_layer,0,0,ts_coast,room_width,room_height);
//var _ground_tilemap_grass=layer_tilemap_create(global.ground_layer,0,0,ts_grass,room_width,room_height);


global.back_layer=layer_create(-1);
global.back_tiles = layer_tilemap_create(global.back_layer, 0, 0, ts_terrain, room_width,room_height);

depth=obj_you.depth+3;

var _freq_nr=20
var _ran_data=0;
var _sprite_size=64;
var _x_sprites=room_width div _sprite_size;
var _y_sprites=room_height div _sprite_size;

global.resource_matrix= [];

for (a=0;a<_x_sprites;a++){
	global.resource_matrix[a] = array_create(_y_sprites,false);
}

for (i=0;i<213;i+=1) {
	for (j=0;j<120;j+=1) {
		// ocean tiles around tile 0
		if (i==0 || i==212 || j==0 || j==119) {	
			tilemap_set_at_pixel(global.back_tiles,irandom_range(1,2),64*i,64*j);
		}
	
		if (i==1 && j==1) {
			tilemap_set_at_pixel(global.back_tiles,5,64*i,64*j);
		}
		if (i==211 && j==118){
			tilemap_set_at_pixel(global.back_tiles,8,64*i,64*j);
		}
		if (i==1 && j==118){
			tilemap_set_at_pixel(global.back_tiles,6,64*i,64*j);
		}
		if (i==211 && j==1){
			tilemap_set_at_pixel(global.back_tiles,7,64*i,64*j);
		}
		
		if (i==1 && j>1 && j<118){
			tilemap_set_at_pixel(global.back_tiles,irandom_range(10,11),64*i,64*j);
		}
		if (i==211 && j>1 && j<118){
			tilemap_set_at_pixel(global.back_tiles,irandom_range(3,4),64*i,64*j);
		}
		if (i>1 && i<211 && j==1){
			tilemap_set_at_pixel(global.back_tiles,irandom_range(20,21),64*i,64*j);
		}
		if (i>1 && i<211 && j==118){
			tilemap_set_at_pixel(global.back_tiles,irandom_range(22,23),64*i,64*j);
		}
		
		if (i>=2 && j>=2) && (i<=210 && j<=117) {
			tilemap_set_at_pixel(global.back_tiles,irandom_range(15,18),64*i,64*j);
		}
	}
}

scr_populate_map_resources(_sprite_size);
