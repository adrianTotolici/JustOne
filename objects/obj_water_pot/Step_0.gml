/// @description Insert description here
// You can write your code in this editor
frame = (frame + 1) % total_frames;
tilemap_set(tilemap_id, 2, 2, tile_index + frame);