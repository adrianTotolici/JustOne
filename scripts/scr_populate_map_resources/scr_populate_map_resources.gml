// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_populate_map_resources(_sprite_size){
	
	for (i=2;i<array_length(global.resource_matrix)-2;i++){
		for (j=2;j<array_length(global.resource_matrix[i])-2;j++){
			if (global.resource_matrix[i][j] != true){
				resource_freq=random_range(1,100);
				if (resource_freq>0 && resource_freq<=5){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_grass);
					global.resource_matrix[i][j] = true;
				}
				if (resource_freq>10 && resource_freq<=12){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_mud_potehole);
					global.resource_matrix[i][j] = true;
				}
				if (resource_freq>20 && resource_freq<=22){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_fruit_bush);
					global.resource_matrix[i][j] = true;
				}
				if (resource_freq>30 && resource_freq<=31){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_water_pot);
					global.resource_matrix[i][j] = true;	
				}
				if (resource_freq>40 && resource_freq<=41){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_rock_pile);
					global.resource_matrix[i][j] = true;	
				}
				if (resource_freq>50 && resource_freq<=51){
					instance_create_layer(i*_sprite_size+_sprite_size/2,j*_sprite_size+_sprite_size/2,"Instances",obj_branch_pile);
					global.resource_matrix[i][j] = true;	
				}
			}
		}
	}
}