/// @description resource
depth=obj_land.depth-1;
shake=false;
shadow=true;
max_grass_drop=irandom(3);
max_mud_drop=irandom(4);
max_coacaze_drop=irandom(7);
max_pebels_drop=irandom(3);
max_brench_drop=irandom(3);

no_resources = false;
loot=false
tool_required = true;
hp=100;
max_hp=100;
show_healthbar=false;
hit=false;
snd_harvest= noone;

alarm[0] = 10*speed;
alarm[1] = 300;
alarm[2] = 100;