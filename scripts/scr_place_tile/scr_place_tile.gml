// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//function scr_place_tile(nr_root, tile_index, xpos, ypos){
//	tilemap_set_at_pixel(global.back_tiles_underground,tile_index,xpos,ypos);
//	var tile_data=noone;
//	for (i=0; i<nr_root; i++){
//		tile_data=tilemap_get_at_pixel(global.back_tiles_underground,xpos,ypos);
//		tile_data = tile_set_rotate(tile_data,true);
//		tilemap_set_at_pixel(global.back_tiles_underground,tile_data,xpos,ypos);
//	}
//}

function scr_place_tile(_nr_root, _tile_index, _xpos, _ypos) {
    // Place the initial tile
    tilemap_set_at_pixel(global.back_tiles_underground, _tile_index, _xpos, _ypos);
    
    // Retrieve the tile data
    var _tile_data = tilemap_get_at_pixel(global.back_tiles_underground, _xpos, _ypos);
    
    // Initialize rotation state
    var _rotation_state = 0;
    
    // Rotate the tile multiple times
    for (var _i = 0; _i < _nr_root; _i++) {
        // Increment rotation state
        _rotation_state = (_rotation_state + 1) % 4; // There are 4 possible rotation states (0, 1, 2, 3)
    }
    
    // Apply the final rotation state to the tile data
    _tile_data = tile_set_rotate(_tile_data, _rotation_state);
    
    // Set the rotated tile back to the tilemap
    tilemap_set_at_pixel(global.back_tiles_underground, _tile_data, _xpos, _ypos);
}