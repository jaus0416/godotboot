extends OptionElement

func _init() -> void:
	option_list = {
		"Fullscreen": DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN,
		"Borderless Windowed": DisplayServer.WINDOW_MODE_WINDOWED,
		"Windowed": DisplayServer.WINDOW_MODE_WINDOWED
	}
	
	localization_list = {
		"Fullscreen": "system_settings_resolution_fullscreen",
		"Borderless Windowed": "system_settings_resolution_borderless_windowed",
		"Windowed": "system_settings_resolution_windowed"
	}

func apply_setting() -> void:
	var last_mode = DisplayServer.window_get_mode()
	match get_value():
		"Fullscreen":
			DisplayServer.window_set_mode(option_list[get_value()])
			DisplayServer.window_set_flag(
					DisplayServer.WINDOW_FLAG_BORDERLESS,
					false
				)
		"Borderless Windowed":
			DisplayServer.window_set_mode(option_list[get_value()])
			DisplayServer.window_set_flag(
				DisplayServer.WINDOW_FLAG_BORDERLESS,
					true
				)
			var resolution = _find_resolution()
			if resolution and resolution.get_value():
				resolution.apply_setting()
		"Windowed":
			DisplayServer.window_set_mode(option_list[get_value()])
			if last_mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
				# 这里有个bug：如果从无窗口->全屏->窗口， 会变成无窗口
				DisplayServer.window_set_flag(
					DisplayServer.WINDOW_FLAG_BORDERLESS,
					true
				)
				DisplayServer.window_set_flag(
					DisplayServer.WINDOW_FLAG_BORDERLESS,
					false
				)
				# 这里有个bug：如果从全屏调整分辨率，且回窗口分辨率不生效 需要等2帧
				await get_tree().process_frame
				await get_tree().process_frame
			else:
				DisplayServer.window_set_flag(
					DisplayServer.WINDOW_FLAG_BORDERLESS,
					false
				)
			var resolution = _find_resolution()
			if resolution and resolution.get_value():
				resolution.apply_setting()
	pass

func _find_resolution() -> OptionElement:
	var parent = self
	while parent:
		if parent is SettingSection:
			break
		parent = parent.get_parent()
	return _find_resolution_by_parent(parent)

func _find_resolution_by_parent(node : Node) -> OptionElement:
	if !node:
		return
	for child in node.get_children():
		if child is OptionElement and child.name == "Resolution":
			return child
		else:
			var find = _find_resolution_by_parent(child)
			if find:
				return find
	return null

func adjust_resolution(sizeScale: float = 1.0) -> void:
	var displaySize: Vector2i =\
		DisplayServer.screen_get_size(
			DisplayServer.window_get_current_screen()
		) * sizeScale
	
	get_window().set_size(displaySize)
	get_viewport().set_size(displaySize)
	get_window().move_to_center()
