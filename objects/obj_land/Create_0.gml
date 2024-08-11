/// @description Map Tile
global.ground_layer=layer_create(-1);
global.ground_tilemap_grass=layer_tilemap_create(global.ground_layer,0,0,ts_grass,room_width,room_height);

var _freq_nr=20
var _ran_data=0;
for (i=0;i<213;i+=1) {
	for (j=0;j<120;j+=1) {
		var _freq=irandom_range(1,_freq_nr);
		if (_freq < _freq_nr-1){
			_ran_data=irandom_range(12,15);
		}else{
			_ran_data=irandom_range(1,11);
		}
		
		tilemap_set_at_pixel(global.ground_tilemap_grass,_ran_data,64*i,64*j);
	}
}