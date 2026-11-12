function scr_run_tests(){
	var _passed=0;
	var _total=0;

	var _items=array_create(4,noone);
	var _amounts=array_create(4,0);
	_items[0]=obj_grass_loot;
	_items[1]=obj_grass_loot;
	_amounts[0]=3;
	_amounts[1]=4;
	_total++;
	if (test_expect(inventory_count_item(_items,_amounts,obj_grass_loot)==7,"inventory count")) _passed++;
	_total++;
	if (test_expect(inventory_count_item(_items,_amounts,obj_branch_loot)==0,"inventory count missing item")) _passed++;
	_total++;
	_items[2]=obj_branch_loot;
	_amounts[2]=0;
	if (test_expect(inventory_count_item(_items,_amounts,obj_branch_loot)==0,"inventory ignores zero stack")) _passed++;
	_total++;
	if (test_expect(inventory_count_item(array_create(0,noone),array_create(0,0),obj_grass_loot)==0,"empty inventory count")) _passed++;

	var _resources=array_create(2,noone);
	var _required=array_create(2,0);
	var _owned=array_create(2,0);
	_resources[0]=obj_grass_loot;
	_resources[1]=obj_branch_loot;
	_required[0]=4;
	_required[1]=2;
	_owned[0]=4;
	_owned[1]=3;
	_total++;
	if (test_expect(inventory_has_resources(_resources,_required,_owned),"crafting accepts sufficient resources")) _passed++;
	_owned[1]=1;
	_total++;
	if (test_expect(!inventory_has_resources(_resources,_required,_owned),"crafting rejects insufficient resources")) _passed++;
	_owned[1]=2;
	_total++;
	if (test_expect(inventory_has_resources(_resources,_required,_owned),"crafting accepts exact resources")) _passed++;
	_resources[1]=noone;
	_required[1]=999;
	_owned[1]=0;
	_total++;
	if (test_expect(inventory_has_resources(_resources,_required,_owned),"crafting ignores unused recipe slots")) _passed++;
	_resources[1]=obj_branch_loot;
	_required[1]=2;
	_owned[1]=1;
	_total++;
	if (test_expect(!inventory_has_resources(_resources,_required,_owned),"crafting detects second missing resource")) _passed++;

	var _player={x:100,y:200,hp:80,hunger:70,thirst:60,attack:5,equipped:obj_stick,head_equipment:noone,body_equipment:noone,leg_equipment:noone,left_foot_equipment:noone,right_foot_equipment:noone};
	var _ui={inventory_list:_items,inventory_num:_amounts,inventory_equiped:array_create(4,false)};
	var _save=scr_build_save_data(_player,_ui);
	_total++;
	if (test_expect(_save.version==1 && _save.player.x==100 && _save.player.inventory_num[1]==4,"save payload")) _passed++;
	_total++;
	if (test_expect(_save.player.y==200 && _save.player.hp==80 && _save.player.hunger==70 && _save.player.thirst==60,"save player vitals")) _passed++;
	_total++;
	if (test_expect(_save.player.attack==5 && _save.player.equipped==obj_stick,"save equipped tool")) _passed++;
	_total++;
	if (test_expect(_save.player.head_equipment==noone && _save.player.right_foot_equipment==noone,"save equipment slots")) _passed++;
	_total++;
	if (test_expect(array_length(_save.player.inventory_list)==4 && array_length(_save.player.inventory_num)==4,"save inventory arrays")) _passed++;
	var _round_trip=json_parse(json_stringify(_save));
	_total++;
	if (test_expect(_round_trip.player.x==100 && _round_trip.player.inventory_num[0]==3,"save JSON round trip")) _passed++;

	_total++;
	if (test_expect(is_tunnel_tile_diggable(5,2,1),"tunnel accepts diggable tile")) _passed++;
	_total++;
	if (test_expect(!is_tunnel_tile_diggable(2,2,1) && !is_tunnel_tile_diggable(1,2,1),"tunnel rejects blocked tiles")) _passed++;
	_total++;
	if (test_expect(is_tunnel_tile_diggable(0,2,1),"tunnel accepts empty tile")) _passed++;
	_total++;
	if (test_expect(!is_tunnel_tile_diggable(5,5,5),"tunnel rejects shared blocked tile")) _passed++;
	_total++;
	if (test_expect(!is_tunnel_tile_diggable(2,2,2),"tunnel rejects blocked tile when both markers match")) _passed++;
	_total++;
	if (test_expect(game_get_speed(gamespeed_fps)==60,"game targets 60 FPS")) _passed++;

	// Inventory rules
	_total++;
	if (test_expect(inventory_slot_can_stack(obj_grass_loot,3,obj_grass_loot,5),"inventory stacks below max")) _passed++;
	_total++;
	if (test_expect(!inventory_slot_can_stack(obj_grass_loot,5,obj_grass_loot,5),"inventory rejects full stack")) _passed++;
	_total++;
	if (test_expect(!inventory_has_free_slot(array_create(3,obj_grass_loot)),"full inventory rejects free slot")) _passed++;
	var _free_items=array_create(3,obj_grass_loot);
	_free_items[1]=noone;
	_total++;
	if (test_expect(inventory_has_free_slot(_free_items),"inventory finds free slot")) _passed++;

	// Startup and runtime smoke checks
	_total++;
	if (test_expect(instance_exists(obj_you),"player instance exists")) _passed++;
	_total++;
	if (test_expect(instance_exists(obj_ui),"UI instance exists")) _passed++;
	_total++;
	if (test_expect(instance_exists(obj_control),"control instance exists")) _passed++;
	_total++;
	if (test_expect(global.back_tiles!=noone,"world tilemap exists")) _passed++;

	// Equipment, harvesting, and combat rules
	_total++;
	if (test_expect(can_use_resource_tool(false,noone,TOOL_TYPE.AXE),"resource without tool requirement is usable")) _passed++;
	_total++;
	if (test_expect(!can_use_resource_tool(true,noone,TOOL_TYPE.AXE),"resource rejects missing tool")) _passed++;
	_total++;
	if (test_expect(remaining_health_after_damage(10,3)==7,"combat applies damage")) _passed++;
	_total++;
	if (test_expect(remaining_health_after_damage(2,5)==0,"combat clamps health at zero")) _passed++;
	_total++;
	if (test_expect(obj_you.attack>=0 && obj_you.hp>=0 && obj_you.hp<=100,"player stats remain valid")) _passed++;

	// Save handling and room-transition smoke checks
	_total++;
	if (test_expect(scr_parse_save_data("{}")==noone,"save rejects missing player data")) _passed++;
	_total++;
	if (test_expect(scr_parse_save_data("")==noone,"save rejects empty data")) _passed++;
	_total++;
	if (test_expect(room==rm_world || room==rm_world_u1,"test runs in a world room")) _passed++;
	_total++;
	if (test_expect(global.back_tiles_underground!=noone,"underground tilemap exists")) _passed++;

	show_debug_message("TESTS: "+string(_passed)+"/"+string(_total)+" passed");
	global.fps_test_active=true;
	global.fps_test_frames=0;
	global.fps_test_total=0;
	show_debug_message("FPS TEST: sampling 120 frames...");
	return _passed==_total;
}

function scr_sample_fps_test(){
	if (!variable_global_exists("fps_test_active") || !global.fps_test_active) return;

	global.fps_test_frames++;
	global.fps_test_total+=fps;
	if (global.fps_test_frames>=120){
		var _average=global.fps_test_total/global.fps_test_frames;
		var _passed=_average>=50;
		var _result="FAIL";
		if (_passed) _result="PASS";
		show_debug_message("FPS TEST: average="+string_format(_average,0,2)+" target>=50 "+_result);
		global.fps_test_active=false;
	}
}

function test_expect(_condition,_name){
	if (_condition){
		show_debug_message("PASS: "+_name);
		return true;
	}
	show_debug_message("FAIL: "+_name);
	return false;
}
