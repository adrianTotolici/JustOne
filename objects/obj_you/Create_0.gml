/// @description vars
image_speed=0.4;
depth=-1;
x=room_width/2;
y=room_height/2;
camera_set_view_pos(view_camera[0],x-window_get_width()/2,y-window_get_height()/2);

//stats
my_speed=2;
equipped=noone;
hp=100;
hunger=100;
thirst=100;
head_armor=0;
body_armor=0;
leg_armor=0;
hand_armor=0;
feet_armor=0;
attack=0.5;

//technical
state=PLAYER_STATE.CONTROLS;
anim_idle=spr_player_stand_front;
anim_walk_left=spr_player_left;
anim_walk_right=spr_player_right;
anim_walk_up=spr_player_up;
anim_walk_down=spr_player_down;
anim_harvest=spr_player_harvest;
show_end_game=false;

head_equipment=noone;
body_equipment=noone;
left_hand_equipment=noone;
right_hand_equipment=noone;
leg_equipment=noone;
left_foot_equipment=noone;
right_foot_equipment=noone;

instance_create_layer(x,y,"Instances",obj_ui);