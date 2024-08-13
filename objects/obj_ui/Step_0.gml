/// @description Player UI
x=obj_you.x;
y=obj_you.y;

var _mx=device_mouse_x_to_gui(0);
var _my=device_mouse_y_to_gui(0);

if (_my>=y_size_ui-sprite_size){
	if (_mx>=x_size_ui/2-sprite_size*2-16 && _mx<=x_size_ui/2+sprite_size*2+16){
		obj_you.state=PLAYER_STATE.QUICK_INVENTORY;
	}
}

if (keyboard_check(vk_anykey)){
	var _key_pressed = keyboard_lastkey;
	switch(_key_pressed){
		case ord("1"):
			if (obj_you.equipped!=slot_list[0]){
				if (slot_list[0]!=noone){
					obj_you.equipped=slot_list[0];
					with (obj_equiped) {
						instance_destroy();
					}
					instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[0]);
				}
			}
			break;

		case ord("2"):
			if (obj_you.equipped!=slot_list[1]){
				if (slot_list[1]!=noone){
					obj_you.equipped=slot_list[1];
					with (obj_equiped) {
						instance_destroy();
					}
					instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[1]);
				}
			}
			break;
			
		case ord("3"):
			if (obj_you.equipped!=slot_list[2]){
				if (slot_list[2]!=noone){
					obj_you.equipped=slot_list[2];
					with (obj_equiped) {
						instance_destroy();
					}
					instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[2]);
				}
			}
			break;
			
		case ord("4"):
			if (obj_you.equipped!=slot_list[3]){
				if (slot_list[3]!=noone){
					obj_you.equipped=slot_list[3];
					with (obj_equiped) {
						instance_destroy();
					}
					instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[3]);
				}
			}
			break;
			
		case ord("5"):
			if (obj_you.equipped!=slot_list[4]){
				if (slot_list[4]!=noone){
					obj_you.equipped=slot_list[4];
					with (obj_equiped) {
						instance_destroy();
					}
					instance_create_layer(obj_you.x, obj_you.y, "Player", slot_list[4]);
				}
			}
			break;
		default:
			break;
	}
}