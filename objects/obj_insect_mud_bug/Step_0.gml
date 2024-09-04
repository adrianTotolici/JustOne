/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (random(100) < 2) { // 2% chance to change direction each step
    direction = irandom(360); // Set a new random direction
}

if (direction>=0 && direction<45 || direction>=315 && direction <=360){
	image_xscale = -1;
	image_yscale = 1;
	sprite_index = spr_mud_bug_walk_side;
}

if (direction>=45 && direction<135){
	image_yscale = 1;
	image_xscale = 1;
	sprite_index = spr_mud_bug_walk_up;
}

if (direction>=135 && direction<225){
	image_xscale = 1;
	image_yscale = 1;
	sprite_index = spr_mud_bug_walk_side;
}

if (direction>=225 && direction<315){
	image_yscale = -1;
	image_xscale = 1;
	sprite_index = spr_mud_bug_walk_up;
}