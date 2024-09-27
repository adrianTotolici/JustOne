/// @description Insert description here
depth=-y;

rain_system = part_system_create();
rain_particle = part_type_create();
part_type_shape(rain_particle, pt_shape_pixel);
part_type_size(rain_particle, 2, 5, 0, 0);
part_type_color1(rain_particle, c_aqua);
part_type_scale(rain_particle, 0.3, 8);
part_type_alpha1(rain_particle, 0.5);
part_type_speed(rain_particle, 5, 10, 0, 0);
part_type_direction(rain_particle, 85, 95, 0, 0);
part_type_gravity(rain_particle, 0.2, 270);
part_type_life(rain_particle,200,500);
rain_emitter = part_emitter_create(rain_system);


raining=false;

alarm[0] = 300;