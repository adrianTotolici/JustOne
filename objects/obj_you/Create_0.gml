/// @description vars
image_speed=0.4;
depth=-1;
x=room_width/2;
y=room_height/2;
camera_set_view_pos(view_camera[0],x-640/2,y-360/2);

//stats
my_speed=2;

//technical
state=PLAYER_STATE.CONTROLS;
anim_idle=spr_player_stand_front;
anim_walk_left=spr_player_left;
anim_walk_right=spr_player_right;
anim_walk_up=spr_player_up;
anim_walk_down=spr_player_down;

instance_create_layer(x,y,"Instances",obj_ui);