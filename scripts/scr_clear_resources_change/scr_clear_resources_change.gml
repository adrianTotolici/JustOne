function scr_clear_resource_change(_resource) {
    if (!variable_global_exists("world_resource_changes")
        || !is_array(global.world_resource_changes)) {
        return;
    }

    var _object_name = asset_get_name(_resource.object_index);

    for (var _i = array_length(global.world_resource_changes) - 1; _i >= 0; _i--) {
        var _entry = global.world_resource_changes[_i];

        if (_entry.object_name == _object_name
            && _entry.x == _resource.x
            && _entry.y == _resource.y) {
            array_delete(global.world_resource_changes, _i, 1);
            return;
        }
    }
}