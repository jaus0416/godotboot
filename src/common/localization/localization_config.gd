## 本地化相关工具
class_name LocalizationConfig extends Configuration

# TODO: for test
func _ready() -> void:
	print("set locale")
	print("pseudolocalization_enabled: " + str(TranslationServer.pseudolocalization_enabled))
	print("get_locale:" + str(TranslationServer.get_locale()))
	print("project setting : " + str(ProjectSettings.get_setting("internationalization/locale/fallback")))
	print("os locale: " + str( OS.get_locale_language()))
	print("loaded locale: " + str(TranslationServer.get_loaded_locales()))
	#TranslationServer.set_locale("ch")
	
	TranslationServer.set_locale(OS.get_locale_language() + "test")
	print(" =========== ")
	print("get_locale after :" + str(TranslationServer.get_locale()))
	print("project setting after: " + str(ProjectSettings.get_setting("internationalization/locale/fallback")))
	pass

# 获取默认地区配置
func get_default_locale() -> String:
	# 检查系统语言
	var _system_locale = OS.get_locale_language()
	if _system_locale != null and TranslationServer.get_loaded_locales().has(_system_locale):
		return _system_locale
	# 使用默认语言
	return ProjectSettings.get_setting("internationalization/locale/fallback")

func init() -> void:
	pass
