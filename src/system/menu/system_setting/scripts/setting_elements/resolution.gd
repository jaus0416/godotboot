extends OptionElement

func _init() -> void:
	option_list = {
		"3840x2160": Vector2i(3840, 2160),
		"2560x1440": Vector2i(2560, 1440),
		"1920x1080": Vector2i(1920, 1080),
		"1280x720": Vector2i(1280, 720),
		"960x540": Vector2i(960, 540)
	}

func apply_setting() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		return
	
	get_window().set_size(option_list[get_value()])
	get_viewport().set_size(option_list[get_value()])
	get_window().move_to_center()
	pass
