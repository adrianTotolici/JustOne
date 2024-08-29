/// @description State Controls
depth=-y;
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
	case PLAYER_STATE.CONTROLS: {scr_player_control();} break;
	case PLAYER_STATE.QUICK_INVENTORY: {scr_player_quick_inventory();} break;
	case PLAYER_STATE.HARVEST: {scr_player_harvest();} break;
	case PLAYER_STATE.INVENTORY: 
		scr_player_inventory();
		scr_player_quick_inventory();
		break; 
}
scr_crafting();