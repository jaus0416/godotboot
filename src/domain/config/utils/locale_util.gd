class_name LocaleUtil extends Node


# 获取默认地区配置
static func get_default_locale() -> String:
	# 检查系统语言
	var _system_locale = OS.get_locale_language()
	if _system_locale != null and TranslationServer.get_loaded_locales().has(_system_locale):
		return _system_locale
	# 使用默认语言
	return ProjectSettings.get_setting("internationalization/locale/fallback")
