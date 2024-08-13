/// @description State Controls
depth=-y;
switch(state)
{
	case PLAYER_STATE.CONTROLS: {scr_player_control();} break;
	case PLAYER_STATE.QUICK_INVENTORY: {scr_player_quick_inventory();} break;
	case PLAYER_STATE.HARVEST: {scr_player_harvest();} break;
}