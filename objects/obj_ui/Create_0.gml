/// @description Vars
depth =obj_land.depth-4;
sprite_size=30;
inventory_sprite_size=128*1.5;
x_size_ui=window_get_width();
y_size_ui=window_get_height();
//_nr_of_boxes=5;
_middle_box_inv = 2;
_inv_nr_columns = 4;
_heigh_diff_inventory = 155;
_text_to_display = "Just One v0.0.8";


display_set_gui_size(x_size_ui,y_size_ui);

show_inv=false;
inventory_list = array_create(16, noone);
inventory_num = array_create(16, 0);
inventory_equiped = array_create(16, false);
inv_selected=noone;

// add test items
inventory_list[0]=obj_rock;
inventory_list[1]=obj_stick;
inventory_list[2]=obj_straw_mug;
inventory_list[3]=obj_grass_house;
inventory_list[4]=obj_grass_loot;

inventory_num[0]=1;
inventory_num[1]=1;
inventory_num[2]=1;
inventory_num[3]=1;
inventory_num[4]=15;


show_crafting=false;
show_tools=false;
show_equipment=false;
show_player_equipment=false;
show_build=false;

//ui build
text_straw_house="10x"


//ui craft menu
craft_menu_width=128+32;
craft_menu_height=256;
text_straw_armor_rec="4x ";
text_straw_pants_rec="3x ";
text_straw_hat_rec="2x ";
text_straw_footware_rec="2x ";
text_straw_mug="1x ";
text_rock="5x ";
text_stick="4x ";
text_axe_stick="1x";
text_axe_stone="1x";
text_no_resources="";
show_text_no_resources=false;
start_alarm=true;


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
