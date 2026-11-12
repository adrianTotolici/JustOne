function scr_inventory_add(){
	var _ui=obj_ui;
	var _stored=false;
	
	for (i=0;i<16;i++){
		if (_ui.inventory_list[i]==object_index){
			if ((_ui.inventory_num[i]+my_stack) < max_stack+1){
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

function inventory_count_item(_inventory_list, _inventory_num, _item){
	var _total=0;
	for (var _i=0; _i<array_length(_inventory_list); _i++){
		if (_inventory_list[_i]==_item) _total+=_inventory_num[_i];
	}
	return _total;
}

function inventory_has_resources(_resources, _required, _owned){
	for (var _i=0; _i<array_length(_resources); _i++){
		if (_resources[_i]!=noone && _required[_i]>_owned[_i]) return false;
	}
	return true;
}

function inventory_slot_can_stack(_slot_item,_slot_amount,_item,_max_stack){
	return _slot_item==_item && _slot_amount<_max_stack;
}

function inventory_has_free_slot(_inventory_list){
	for (var _i=0; _i<array_length(_inventory_list); _i++){
		if (_inventory_list[_i]==noone) return true;
	}
	return false;
}
