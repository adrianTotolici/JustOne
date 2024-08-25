/// @description State Controls
depth=-y;
hunger-=0.001;
if (hunger<5){
	hp-=0.005;
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