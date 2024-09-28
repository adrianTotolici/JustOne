function scr_populate_map_resources(_sprite_size){
	image_xscale=0.5;
	image_yscale=0.5;
	
	for (i=2;i<array_length(global.resource_matrix)-2;i++){
		for (j=2;j<array_length(global.resource_matrix[i])-2;j++){
			if (global.resource_matrix[i][j] != true){
				resource_freq=random_range(1,500);
				if (resource_freq>60 && resource_freq<=61){
					
					// scr_generate_forest
					forest_width = irandom_range(5,13);
					forest_height = irandom_range(5,13);
					tree_count = irandom_range(50,200); // Number of trees to generate

					for (a = 0; a < tree_count; a++) {
						tx = irandom(forest_width);
						ty = irandom(forest_height);
						if ((i+tx-1) < array_length(global.resource_matrix)-2 && (j+ty)< array_length(global.resource_matrix[i])-2 && global.resource_matrix[i+tx][j+ty]==false && global.resource_matrix[i+tx-1][j+ty]==false){
							instance_create_layer((i+tx)*_sprite_size+_sprite_size/2, (j+ty)*_sprite_size+_sprite_size/2, "Instances", obj_small_tree);
							global.resource_matrix[i+tx][j+ty]=true;
							global.resource_matrix[i+tx-1][j+ty]=true;
						}
					}
				}
			}
		}
	}
	
	for (i=2;i<array_length(global.resource_matrix)-2;i++){
		for (j=2;j<array_length(global.resource_matrix[i])-2;j++){
			if (global.resource_matrix[i][j] != true){
				resource_freq=random_range(1,100);
				if (resource_freq>0 && resource_freq<=4){
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
	
	image_xscale=1;
	image_yscale=1;
}
