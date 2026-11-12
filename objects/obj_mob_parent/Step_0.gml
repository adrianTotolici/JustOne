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

// Reduce attack cooldown
if (attack_cooldown > 0) {
    attack_cooldown--;
}

// Check whether the player exists
if (instance_exists(obj_you)) {
    // Check distance on BOTH axes
    var _close_x = abs(obj_you.x - x) <= 15;
    var _close_y = abs(obj_you.y - y) <= 15;
    if (_close_x && _close_y) {
        sprite_index = spr_atack;
        // Attack once per second
        if (attack_cooldown <= 0) {
            var _total_armor =
                obj_you.head_armor +
                obj_you.body_armor +
                obj_you.leg_armor +
                obj_you.feet_armor;

            var _damage = attack - _total_armor;
            if (_damage > 0) {
                obj_you.hp -= _damage;
            }
            attack_cooldown = room_speed;
        }
    }
}