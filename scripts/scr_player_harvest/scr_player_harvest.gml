// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_harvest(){
	if (mouse_check_button(mb_left)){
		var _resources = instance_position(mouse_x, mouse_y, obj_par_resource);
		var _player = obj_you;
		
		x_min=obj_you.x-50;
		x_max=obj_you.x+50;
		
		y_min=obj_you.y-50;
		y_max=obj_you.y+50;
		
		if (instance_exists(_resources) && (x_min<=_resources.x && _resources.x<=x_max) && (y_min<=_resources.y && _resources.y<=y_max) && _resources.no_resources==false && _resources!=_player){
			if (sprite_index!=anim_harvest){
				sprite_index=anim_harvest;
				image_index=0;
			}
			if (image_index>=image_number-1){
				_resources.hp-=_player.attack;
				_resources.show_healthbar=true;
				if (_resources.shake!=true){
					_resources.shake=true;
				}
			}
		}else{
			if (sprite_index!=anim_idle){
				sprite_index=anim_idle;
				image_index=0;
			}
			with (obj_par_resource){
				shake=false;
			}
			
			state=PLAYER_STATE.CONTROLS;
		}
	}else{
		if (sprite_index!=anim_idle){
			sprite_index=anim_idle;
			image_index=0;
		}
		with (obj_par_resource){
			shake=false;
		}
		state=PLAYER_STATE.CONTROLS;
		play_sound=true;
	}
}