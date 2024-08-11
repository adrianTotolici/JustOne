// Script assets have changed for v2.3.0 see
function scr_player_quick_inventory(){
	var mx=device_mouse_x_to_gui(0);
	var my=device_mouse_y_to_gui(0);
	var ui=obj_ui;
	if (sprite_index!=anim_idle){
		sprite_index=anim_idle;
		image_index=0;
	}
	var middle_box = (array_length(ui.slotList)-1) div 2;

	if(mouse_check_button_pressed(mb_left)){
		if (my<ui.y_size_ui-ui.sprite_size){
			if (ui.slot_selected==noone) {
				obj_you.state=player_state.controls;
			}
		}else{
			if (ui.slot_selected==noone){
				for (i=0;i<array_length(ui.slotList);i++){
					if (mx>=ui.x_size_ui/2+(ui.sprite_size*(i-middle_box))-16 && mx<=ui.x_size_ui/2+(ui.sprite_size*(i-middle_box))+16){
						ui.slotSelectedList[i]=true;
						ui.slot_selected=ui.slotList[i];
						break;
					}
				}
			}else{
				for (i=0;i<array_length(ui.slotList);i++){
					if (mx>=ui.x_size_ui/2+(ui.sprite_size*(i-middle_box))-16 && mx<=ui.x_size_ui/2+(ui.sprite_size*(i-middle_box))+16){
						for (j=0;j<array_length(ui.slotList);j++){
							if (i==j){
								if (ui.slotSelectedList[j]==true){
									ui.slotSelectedList[j]=false;
									break;
								}
							}else{
								if (ui.slotSelectedList[j]==true){
									ui.slotList[j]=ui.slotList[i];
									ui.slotList[i]=ui.slot_selected;
									break;
								}
							}
						}
						for (k=0;k<array_length(ui.slotList);k++){
							ui.slotSelectedList[k]=false;
						}
						ui.slot_selected=noone;
					}
				}
			}
		}
	}
}