/// @description State Controls
depth=-y;
switch(state)
{
	case player_state.controls: {scr_player_control();} break;
	case player_state.quick_inventory: {scr_player_quick_inventory();} break;
}