extends OptionElement

func _init() -> void:
	option_list = {
		"English" : "en",
		"中文" : "zh"
	}

func apply_setting() -> void:
	TranslationServer.set_locale(option_list[get_value()])
	pass
