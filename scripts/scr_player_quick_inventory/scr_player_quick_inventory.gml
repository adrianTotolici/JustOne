function scr_player_quick_inventory(){
	var _mx=device_mouse_x_to_gui(0);
	var _my=device_mouse_y_to_gui(0);
	var _ui=obj_ui;
	if (sprite_index!=anim_idle){
		sprite_index=anim_idle;
		image_index=0;
	}

	if (mouse_check_button_pressed(mb_right)){
		if (_ui.slot_selected==noone){
			if (_my>=_ui.y_size_ui-_ui.sprite_size+2){
				for (i=0;i<array_length(_ui.slot_list);i++){
					if (_mx>=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))-16 && _mx<=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))+16){
						_ui.slot_list[i]=noone;
					}
				}
			}
		}
	}else{
		if(mouse_check_button_pressed(mb_left)){
			if (_ui.slot_selected==noone){
				for (i=0;i<array_length(_ui.slot_list);i++){
					if (_my>=_ui.y_size_ui-_ui.sprite_size+2){
						if (_ui.inv_selected==noone){
							if (_mx>=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))-16 && _mx<=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))+16 && _my >=_ui.y_size_ui-_ui.sprite_size+2){
								_ui.slot_selected_list[i]=true;
								_ui.slot_selected=_ui.slot_list[i];
								break;
							}
						}
						_ui.inv_selected=noone;
					}
				}
			}else{
				for (i=0;i<array_length(_ui.slot_list);i++){
					if (_mx>=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))-16 && _mx<=_ui.x_size_ui/2+(_ui.sprite_size*(i-_ui._middle_box))+16 && _my >=_ui.y_size_ui-_ui.sprite_size+2){
						for (j=0;j<array_length(_ui.slot_list);j++){
							if (i==j){
								if (_ui.slot_selected_list[j]==true){
									_ui.slot_selected_list[j]=false;
									break;
								}
							}else{
								if (_ui.slot_selected_list[j]==true){
									_ui.slot_list[j]=_ui.slot_list[i];
									_ui.slot_list[i]=_ui.slot_selected;
									break;
								}
							}
						}
						for (k=0;k<array_length(_ui.slot_list);k++){
							_ui.slot_selected_list[k]=false;
						}
						_ui.slot_selected=noone;
					}
				}
			}
		}
	}
	if (_ui.show_inv==false) {
		if (_my=_ui.y_size_ui-_ui.sprite_size+2){
			if(_ui.slot_selected==noone){
				obj_you.state=PLAYER_STATE.CONTROLS;
			}
		}
	}
}