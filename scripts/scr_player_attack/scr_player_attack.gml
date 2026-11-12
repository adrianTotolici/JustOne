// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_attack(){
	if (mouse_check_button(mb_left)){
		var _creature = instance_position(mouse_x, mouse_y, obj_creature_parent);
		var _player = obj_you;
		
		x_min=obj_you.x-50;
		x_max=obj_you.x+50;
		
		y_min=obj_you.y-50;
		y_max=obj_you.y+50;
		
		if (instance_exists(_creature) && (x_min<=_creature.x && _creature.x<=x_max) && (y_min<=_creature.y && _creature.y<=y_max)){
			if (sprite_index!=anim_harvest){
				sprite_index=anim_harvest;
				image_index=0;
			}
			_creature.hp=remaining_health_after_damage(_creature.hp,_player.attack);
			_creature.show_healthbar=true;
		}else{
			if (sprite_index!=anim_idle){
				sprite_index=anim_idle;
				image_index=0;
			}
			state=PLAYER_STATE.CONTROLS;
		}
	}else{
		if (sprite_index!=anim_idle){
			sprite_index=anim_idle;
			image_index=0;
		}
		state=PLAYER_STATE.CONTROLS;
	}
}

function remaining_health_after_damage(_health,_damage){
	return max(0,_health-_damage);
}
