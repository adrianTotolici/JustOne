/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (random(100) < 2) { // 2% chance to change direction each step
    direction = irandom(360); // Set a new random direction
}

if (direction>=0 && direction<45 || direction>=315 && direction <=360){
	image_xscale = -1*xscale;
	image_yscale = 1*yscale;
	sprite_index = spr_side;
}

if (direction>=45 && direction<135){
	image_yscale = 1*yscale;
	image_xscale = 1*xscale;
	sprite_index = spr_up;
}

if (direction>=135 && direction<225){
	image_xscale = 1*xscale;
	image_yscale = 1*yscale;
	sprite_index = spr_side;
}

if (direction>=225 && direction<315){
	image_yscale = 1*yscale;
	image_xscale = 1*xscale;
	sprite_index = spr_down;
} 

if(obj_you.x>=x-15 && obj_you.x<=x+15 || obj_you.y>=y-15 && obj_you.y<=y+15){
	sprite_index = spr_atack;
	var _total_armor=obj_you.head_armor+obj_you.body_armor+obj_you.leg_armor+obj_you.feet_armor;
	var _damage=attack-_total_armor;
	if (_damage>0){
		obj_you.hp -= _damage;
	}
}