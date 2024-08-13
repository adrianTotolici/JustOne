// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_tool(){
	var _owner = obj_you;
	var img=ceil(_owner.image_index)-1;
	var _scale_equipment=0.5;
	x=_owner.x;
	y=_owner.y;
	switch(_owner.sprite_index){
		case obj_you.anim_idle:
			if (img==0 || img==1){
				draw_sprite_ext(sprite_index, image_index, _owner.x-11*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
		
		case obj_you.anim_walk_down:
			if (img==0){
				draw_sprite_ext(sprite_index, image_index, _owner.x-9*_owner.image_xscale, _owner.y-13, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==1 || img == 3){
				draw_sprite_ext(sprite_index, image_index, _owner.x-9*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==2){
				draw_sprite_ext(sprite_index, image_index, _owner.x-10*_owner.image_xscale, _owner.y-17, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
		
		case obj_you.anim_walk_up:
			if (img==0){
				draw_sprite_ext(sprite_index, image_index, _owner.x+10*_owner.image_xscale, _owner.y-19, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==1 || img == 3){
				draw_sprite_ext(sprite_index, image_index, _owner.x+10*_owner.image_xscale, _owner.y-16, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==2){
				draw_sprite_ext(sprite_index, image_index, _owner.x+9*_owner.image_xscale, _owner.y-14, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
			
		case obj_you.anim_walk_left:
			if (img==0){
				draw_sprite_ext(sprite_index, image_index, _owner.x+7*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==1 || img == 3){
				depth=_owner.depth+12;
				draw_sprite_ext(sprite_index, image_index, _owner.x-1*_owner.image_xscale, _owner.y-13, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==2){
				depth=_owner.depth+12;
				draw_sprite_ext(sprite_index, image_index, _owner.x-9*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
			
		case obj_you.anim_walk_right:
			if (img==0){
				draw_sprite_ext(sprite_index, image_index, _owner.x+6*_owner.image_xscale, _owner.y-14, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==1 || img == 3){
				draw_sprite_ext(sprite_index, image_index, _owner.x+2*_owner.image_xscale, _owner.y-13, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==2){
				draw_sprite_ext(sprite_index, image_index, _owner.x-8*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
			
		case obj_you.anim_harvest:
			if (img==0){
				draw_sprite_ext(sprite_index, image_index, _owner.x-7*_owner.image_xscale, _owner.y-15, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}else if (img==1){
				draw_sprite_ext(sprite_index, image_index, _owner.x-4*_owner.image_xscale, _owner.y-16, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
			}
			break;
	}
}