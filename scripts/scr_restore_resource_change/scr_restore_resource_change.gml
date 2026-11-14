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

		// Find the generated resource by its exact saved coordinates
		var _resource = noone;
		for (var _j = 0; _j < instance_number(_object); _j++) {
		    var _candidate = instance_find(_object, _j);
		    if (_candidate.x == _entry.x && _candidate.y == _entry.y) {
		        _resource = _candidate;
		        break;
		    }
		}

		// Skip if the generated resource cannot be found
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