/// @description Initialize
depth=-y;
shadow_y=y;
initialize=false;
image_xscale=image_xscale*0.75;
image_yscale=image_yscale*0.75;

var _ran_x=irandom_range(-50,50);
my_path=path_add();
path_add_point(my_path,x,y,20);
path_add_point(my_path,x+_ran_x,y-30,20);
path_add_point(my_path,x+_ran_x,y,20);
path_set_precision(my_path,8);
path_set_closed(my_path,false);
path_start(my_path,20,0,0);

alarm[0]=300*speed;

max_stack=20;
