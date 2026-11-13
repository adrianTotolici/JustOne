function scr_track_resource_change(_resource) {
    if (!variable_global_exists("world_resource_changes") || !is_array(global.world_resource_changes)) {
        global.world_resource_changes = [];
    }

    var _object_name = object_get_name(_resource.object_index);
    // Avoid recording the same resource more than once
    for (var _i = 0; _i < array_length(global.world_resource_changes); _i++) {
        var _entry = global.world_resource_changes[_i];
        if (_entry.object_name == _object_name && _entry.x == _resource.x && _entry.y == _resource.y) {
            return;
        }
    }

    array_push(global.world_resource_changes, {
        object_name: _object_name,
        x: _resource.x,
        y: _resource.y,
        sprite_name: object_get_name(_resource.sprite_index),
        image_index: _resource.image_index,
        alarm_0: _resource.alarm[0],
        alarm_1: _resource.alarm[1],
        shadow: _resource.shadow
    });
}
