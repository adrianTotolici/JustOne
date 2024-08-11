/// @description Vars
depth =-5;
sprite_size=30;
x_size_ui=640;
y_size_ui=360;
var nr_of_boxes=5;

display_set_gui_size(x_size_ui,y_size_ui);

slotList = array_create(nr_of_boxes, noone);
slotSelectedList = array_create(nr_of_boxes, false);

slotList[0]=spr_rock;
slotList[1]=spr_stick;
slot_selected=noone;
