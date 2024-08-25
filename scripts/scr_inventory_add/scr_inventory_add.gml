function scr_inventory_add(){
	var _ui=obj_ui;
	var _stored=false;
	
	for (i=0;i<16;i++){
		if (_ui.inventory_list[i]==object_index){
			if (_ui.inventory_num[i]+my_stack<max_stack){
				_ui.inventory_num[i]+=my_stack;
				_stored=true;
				instance_destroy();
				break;
			}
		}
	}
	if (_stored==false){
		for (i=0;i<16;i++){
			if (_ui.inventory_list[i]==noone){
				_ui.inventory_list[i]=object_index;
				_ui.inventory_num[i]=my_stack;
				_stored=true;
				instance_destroy();
				break;
			}
		}
	}
}