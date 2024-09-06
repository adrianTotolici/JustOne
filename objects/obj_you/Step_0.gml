/// @description State Controls
if (hunger>0){
	hunger-=0.001;
}

if (thirst>0){
	thirst-=0.001;
}

if (hunger<5) || (thirst<5){
	if (hp >0){
		hp-=0.005;
	}
}

switch(state)
{
	case PLAYER_STATE.CONTROLS:{scr_player_control();}break;
	case PLAYER_STATE.QUICK_INVENTORY: {scr_player_quick_inventory();} break;
	case PLAYER_STATE.HARVEST: {scr_player_harvest();} break;
	case PLAYER_STATE.INVENTORY: 
		scr_player_inventory();
		scr_player_quick_inventory();
		break; 
}
scr_crafting();
scr_draw_armor();

if (hp<=0){
	show_end_game=true;
	if (keyboard_check_released(vk_anykey) || mouse_check_button_pressed(mb_any)){
		room_goto(rm_menu);
	}
}

if (keyboard_check(vk_escape)){
	room_goto(rm_menu);
}