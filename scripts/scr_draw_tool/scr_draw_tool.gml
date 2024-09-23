// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_tool(){
	var _owner = obj_you;
	var _img=ceil(_owner.image_index)-1;
	var _scale_equipment=0.5;
	x=_owner.x;
	y=_owner.y;
	depth = _owner.depth-2;
	player_instance=instance_find(obj_you,0);
	if (player_instance.visible){
		switch(_owner.sprite_index){
			case obj_you.anim_idle:
				draw_sprite_ext(sprite_index, image_index, _owner.x-11*_owner.image_xscale, _owner.y-21, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				break;
		
			case obj_you.anim_walk_down:
				if (_img==2){
					draw_sprite_ext(sprite_index, image_index, _owner.x-11*_owner.image_xscale, _owner.y-27, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==1 || _img == 3){
					draw_sprite_ext(sprite_index, image_index, _owner.x-11*_owner.image_xscale, _owner.y-24, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else{
					draw_sprite_ext(sprite_index, image_index, _owner.x-11*_owner.image_xscale, _owner.y-21, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}
				break;
		
			case obj_you.anim_walk_up:
				if (_img==7 || _img==5){
					draw_sprite_ext(sprite_index, image_index, _owner.x+10*_owner.image_xscale, _owner.y-23, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==6){
					draw_sprite_ext(sprite_index, image_index, _owner.x+10*_owner.image_xscale, _owner.y-25, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else{
					draw_sprite_ext(sprite_index, image_index, _owner.x+10*_owner.image_xscale, _owner.y-21, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}
				break;
			
		
			case obj_you.anim_walk_side:
				if (_img==0 || _img==4){
					draw_sprite_ext(sprite_index, 0, _owner.x-2*_owner.image_xscale, _owner.y-20, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==1 || _img == 3){
					draw_sprite_ext(sprite_index, 0, _owner.x+7*_owner.image_xscale, _owner.y-22, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==2){
					draw_sprite_ext(sprite_index, 0, _owner.x+9*_owner.image_xscale, _owner.y-22, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==5 || _img==7){
					draw_sprite_ext(sprite_index, 0, _owner.x-10*_owner.image_xscale, _owner.y-19, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==6){
					draw_sprite_ext(sprite_index, 0, _owner.x-14*_owner.image_xscale, _owner.y-25, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}
				break;
			
			case obj_you.anim_harvest:
				if (_img==0){
					draw_sprite_ext(sprite_index, image_index, _owner.x-2*_owner.image_xscale, _owner.y-20, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}else if (_img==1){
					draw_sprite_ext(sprite_index, image_index, _owner.x-21*_owner.image_xscale, _owner.y-22, _owner.image_xscale*_scale_equipment, _owner.image_yscale*_scale_equipment, 290*_owner.image_xscale,c_white,1);
				}
				break;
			default:
				break;
		}
	}
}