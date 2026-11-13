function scr_restore_building_changes(_building_changes) {
    if (!is_array(_building_changes)) {
        return;
    }

    var _sprite_size = 64;

    for (var _i = 0; _i < array_length(_building_changes); _i++) {
        var _building = _building_changes[_i];
        var _object = asset_get_index(_building.object_name);

        // Only restore supported player-built structures
        if (_object != obj_grass_house && _object != obj_camp_fire) {
            continue;
        }

        var _grid_x = floor(_building.x / _sprite_size);
        var _grid_y = floor(_building.y / _sprite_size);

        // Ensure the saved position is inside the resource matrix
        if (_grid_x < 0 || _grid_x >= array_length(global.resource_matrix)) {
            continue;
        }

        if (_grid_y < 0 || _grid_y >= array_length(global.resource_matrix[_grid_x])) {
            continue;
        }

        // Recreate the building and reserve its grid cell
        instance_create_layer(_building.x, _building.y, "Instances", _object);
        global.resource_matrix[_grid_x][_grid_y] = true;
    }
}