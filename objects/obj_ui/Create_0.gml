/// @description Vars
depth =-5;
sprite_size=30;
x_size_ui=window_get_width();
y_size_ui=window_get_height();
var _nr_of_boxes=5;

display_set_gui_size(x_size_ui,y_size_ui);

slot_list = array_create(_nr_of_boxes, noone);
slot_selected_list = array_create(_nr_of_boxes, false);

slot_list[0]=obj_rock;
slot_list[1]=obj_stick;
slot_selected=noone;

