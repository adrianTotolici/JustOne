/// @description Main
depth=-y;
if (path_index==-1){
	initialize=true;
}
if (initialize==true){
	if (instance_place(x,y,obj_par_loot)){
		move_outside_all(irandom(360),2);
	}
}