function scr_track_building_change(_building) {
    if (!variable_global_exists("world_building_changes")
        || !is_array(global.world_building_changes)) {
        global.world_building_changes = [];
    }

    array_push(global.world_building_changes, {
        object_name: object_get_name(_building.object_index),
        x: _building.x,
        y: _building.y
    });
}