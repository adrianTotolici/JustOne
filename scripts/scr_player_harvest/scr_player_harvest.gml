// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_harvest(){
	if (mouse_check_button(mb_left)){
		var resources = instance_position(mouse_x, mouse_y, obj_resource);
		if (instance_exists(resources)){
			if (sprite_index!=anim_harvest){
				sprite_index=anim_harvest;
				image_index=0;
			}
			if (image_index>=image_number-1){
				resources.hp-=5;
				if (resources.shake!=true){
					resources.shake=true;
				}
			}
		}else{
			if (sprite_index!=anim_idle){
				sprite_index=anim_idle;
				image_index=0;
			}
			with (obj_resource){
				shake=false;
			}
			state=PLAYER_STATE.CONTROLS;
		}
	}else{
		if (sprite_index!=anim_idle){
			sprite_index=anim_idle;
			image_index=0;
		}
		with (obj_resource){
			shake=false;
		}
		state=PLAYER_STATE.CONTROLS;
	}
}