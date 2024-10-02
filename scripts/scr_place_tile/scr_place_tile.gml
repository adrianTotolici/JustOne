// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_place_tile(nr_root, tile_index, xpos, ypos){
	tilemap_set_at_pixel(global.back_tiles_underground,tile_index,xpos,ypos);
	var tile_data=noone;
	for (i=0; i<nr_root; i++){
		tile_data = tilemap_get_at_pixel(global.back_tiles_underground,xpos,ypos);
		tile_data = tile_set_rotate(tile_data,true);
		tilemap_set_at_pixel(global.back_tiles_underground,tile_data,xpos,ypos);
	}
}