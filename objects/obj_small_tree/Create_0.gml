/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
depth=obj_land.depth-2;
required = TOOL_TYPE.AXE;
max_hp=100;
hp=max_hp;
snd_harvest=snd_tree_fall;
image_xscale=image_xscale*2;
image_yscale=image_yscale*2;
max_wood_drop=irandom(2);
max_brench_drop=irandom(3);
max_bark_drop=irandom(2);

tree_type=irandom_range(1,10);
if (tree_type==1){
	sprite_index=spr_small_tree;
}else{
	sprite_index=spr_small_tree_leaf;
}

