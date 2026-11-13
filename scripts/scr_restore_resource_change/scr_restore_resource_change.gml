function scr_restore_resource_changes(_resource_changes) {
    if (!is_array(_resource_changes)) {
        return;
    }

    for (var _i = 0; _i < array_length(_resource_changes); _i++) {
        var _entry = _resource_changes[_i];

        // Resolve the original resource object
        var _object = asset_get_index(_entry.object_name);

        if (_object == -1 || !object_exists(_object)) {
            continue;
        }

        // Find the generated resource at its original position
        var _resource = instance_position(_entry.x, _entry.y, _object);

        // Some resources, such as mud potholes, are destroyed when harvested
        if (_resource == noone) {
            continue;
        }
		
		// Mud potholes are destroyed when harvested
		if (_object == obj_mud_potehole) {
		    with (_resource) {
		        instance_destroy();
		    }
		    continue;
		}

        // Resolve the depleted sprite
        var _sprite = asset_get_index(_entry.sprite_name);

        if (_sprite == -1 || !sprite_exists(_sprite)) {
            continue;
        }

        // Restore the depleted appearance without spawning loot again
        _resource.hp = 0;
        _resource.no_resources = true;
        _resource.hit = true;
        _resource.sprite_index = _sprite;
        _resource.image_index = _entry.image_index;
        _resource.alarm[0] = _entry.alarm_0;
        _resource.alarm[1] = _entry.alarm_1;
        _resource.shadow = _entry.shadow;
    }
}