/// @description Vars
depth =-5;
sprite_size=30;
inventory_sprite_size=128;
x_size_ui=window_get_width();
y_size_ui=window_get_height();
_nr_of_boxes=5;
_middle_box_inv = 2;
_inv_nr_columns = 4;
_heigh_diff_inventory = 105;
_text_to_display = "Just One v0.0.3";


display_set_gui_size(x_size_ui,y_size_ui);

slot_list = array_create(_nr_of_boxes, noone);
slot_selected_list = array_create(_nr_of_boxes, false);


slot_selected=noone;
_middle_box = (array_length(slot_list)-1) div 2;

show_inv=false;
inventory_list = array_create(16, noone);
inventory_num = array_create(16, 0);
inv_selected=noone;

// add test items
slot_list[0]=obj_rock;
slot_list[1]=obj_stick;
inventory_list[0]=slot_list[0];
inventory_list[1]=slot_list[1];
inventory_num[0]=1;
inventory_num[1]=1;