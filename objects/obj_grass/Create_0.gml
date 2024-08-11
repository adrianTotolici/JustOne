/// @description grass
// You can write your code in this editor
var _freq_nr=5
for (i=0;i<213;i+=1) {
	for (j=0;j<120;j+=1) {
		var _freq=irandom_range(1,_freq_nr);
		if (_freq = _freq_nr-1){
			instance_place(64*i,64*j,obj_grass)
		}
	}
}