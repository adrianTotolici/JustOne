/// @description vars
depth = obj_you.depth-1;
max_stack=1;
my_stack=1;
on_floor=false;

var _ran_x=irandom_range(-50,50);
my_path=path_add();
path_add_point(my_path,x,y,20);
path_add_point(my_path,x+_ran_x,y-30,20);
path_add_point(my_path,x+_ran_x,y,20);
path_set_precision(my_path,8);
path_set_closed(my_path,false);
path_start(my_path,20,0,0);

alarm[0]=600*speed;