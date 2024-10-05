/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (obj_rain.raining){
	hp=50;
	no_resources=false;
	switch(spr_number){
		case 1:
			sprite_index = spr_water_pot_1;
			break;
		case 2:
			sprite_index = spr_water_pot_2;
			break;
		case 3:
			sprite_index = spr_water_pot_3;
			break;
	}
}