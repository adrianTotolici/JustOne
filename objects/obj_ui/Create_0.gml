/// @description Vars
depth =obj_you.depth-1;
sprite_size=30;
inventory_sprite_size=128*1.5;
x_size_ui=window_get_width();
y_size_ui=window_get_height();
//_nr_of_boxes=5;
_middle_box_inv = 2;
_inv_nr_columns = 4;
_heigh_diff_inventory = 155;
_text_to_display = "Just One v0.0.9";


display_set_gui_size(x_size_ui,y_size_ui);

show_inv=false;
inventory_list = array_create(16, noone);
inventory_num = array_create(16, 0);
inventory_equiped = array_create(16, false);
inv_selected=noone;

// add test items
inventory_list[0]=obj_rock;
inventory_list[1]=obj_stick;
inventory_list[2]=obj_wood_weapon_lvl0;
inventory_list[3]=obj_straw_mug;
inventory_list[4]=obj_branch_loot;
inventory_list[5]=obj_axe;
inventory_list[6]=obj_tree_bark_loot;
inventory_list[7]=obj_stone_pickaxe;

inventory_num[0]=1;
inventory_num[1]=1;
inventory_num[2]=1;
inventory_num[3]=1;
inventory_num[4]=15;
inventory_num[5]=1;
inventory_num[6]=15;
inventory_num[7]=1;


show_crafting=false;
show_tools=false;
show_equipment=false;
show_player_equipment=false;
show_build=false;

ui_buttons_spr=array_create(6,noone);
ui_buttons_spr[0]=spr_craft_ui_1;
ui_buttons_spr[1]=spr_help;
ui_buttons_spr[2]=spr_craft_ui;
ui_buttons_spr[3]=spr_equipment_ui;
ui_buttons_spr[4]=spr_build_ui;
ui_buttons_spr[5]=spr_save_buton;

//----------------------------------------ui build
building_nr=2;
sprite_build=array_create(building_nr, noone);
text_build=array_create(building_nr, noone);
materials_sprite_build=array_create(building_nr, noone);
//grass house
sprite_build[0]=spr_grass_house;
text_build[0]="10x "
materials_sprite_build[0]=spr_grass_loot;
//campfire
sprite_build[1]=spr_camp_fire;
text_build[1]="3x "
materials_sprite_build[1]=spr_wood_loot;

//--------------------------------------ui craft menu
craft_menu_width=128+32;
craft_menu_height=512;
//++++++++++ armor
armors_nr=8
sprite_armors=array_create(armors_nr, noone);
text_armors=array_create(armors_nr, noone);
material_armors=array_create(armors_nr, noone);
//straw_armor
sprite_armors[0]=spr_straw_armor;
text_armors[0]="4x ";
material_armors[0]=spr_grass_loot;
//straw pants
sprite_armors[1]=spr_straw_pants;
text_armors[1]="3x ";
material_armors[1]=spr_grass_loot;
//straw hat
sprite_armors[2]=spr_straw_hat;
text_armors[2]="2x ";
material_armors[2]=spr_grass_loot;
//straw footware
sprite_armors[3]=spr_straw_sock;
text_armors[3]="2x ";
material_armors[3]=spr_grass_loot;
//bark_armor
sprite_armors[4]=spr_bark_armor;
text_armors[4]="4x ";
material_armors[4]=spr_tree_barck_loot;
//bark pants
sprite_armors[5]=spr_bark_pants;
text_armors[5]="3x ";
material_armors[5]=spr_tree_barck_loot;
//bark hat
sprite_armors[6]=spr_bark_hat;
text_armors[6]="2x ";
material_armors[6]=spr_tree_barck_loot;
//bark footware
sprite_armors[7]=spr_bark_sock;
text_armors[7]="2x ";
material_armors[7]=spr_tree_barck_loot;


//+++++++++++++ tools
tools_nr=8;
sprite_tools=array_create(tools_nr, noone);
material_tools=array_create(tools_nr, noone);
text_tools=array_create(tools_nr, noone);
//straw mug
sprite_tools[0]=spr_straw_mug;
material_tools[0][0]=spr_grass_loot;
text_tools[0][0]="1x ";
//rock
sprite_tools[1]=spr_rock;
text_tools[1][0]="5x ";
material_tools[1][0]=spr_rock_loot;
//stick
sprite_tools[2]=spr_stick;
text_tools[2][0]="4x ";
material_tools[2][0]=spr_branch_loot;
//rock axe
sprite_tools[3]=spr_axe;
text_tools[3][0]="1x ";
text_tools[3][1]="1x ";
material_tools[3][0]=spr_branch_loot;
material_tools[3][1]=spr_rock_loot;
//wood weapon
sprite_tools[4]=spr_wood_weapon;
text_tools[4][0]="10x ";
material_tools[4][0]=spr_branch_loot;
//rock pickaxe
sprite_tools[5]=spr_pickaxe;
text_tools[5][0]="2x ";
text_tools[5][1]="1x ";
material_tools[5][0]=spr_rock_loot;
material_tools[5][1]=spr_branch_loot;

text_no_resources="";
show_text_no_resources=false;
start_alarm=true;

show_enemy_health=false;
enemy_max_health=0;
enemy_health=0;


// screen menu buttons
button_height=32;
button_width=32;

// ui help
show_help=false;
help_move_text="Move around using the W, A, S, and D keys!"
help_quick_inventory="Press 1 to 5 to quickly equip tools from the inventory at the bottom."
help_inventory= "Press 'I' to open your inventory."
help_crafting = "Click the 'C' button on the screen to open the crafting menu."
help_ui_close = "Press 'F1' to close the help menu."
help_exit_main_menu = "Press 'ESC' to exit to main menu."

text_game_saved = "Game saved";
show_game_saved=false;
