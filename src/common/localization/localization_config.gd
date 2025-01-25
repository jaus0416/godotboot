## 本地化相关工具
class_name LocalizationConfig extends Configuration

const LOCALE_CONFIG_KEY = "locale"

func init() -> void:
	load_locale()
	pass

# 获取默认地区配置
func get_default_locale() -> String:
	# 检查系统语言
	var _system_locale = OS.get_locale_language()
	if _system_locale != null and TranslationServer.get_loaded_locales().has(_system_locale):
		return _system_locale
	# 使用默认语言
	return ProjectSettings.get_setting("internationalization/locale/fallback")

func load_locale() -> void:
	# 读取配置文件
	var _locale_in_file = _load_locale_from_file()
	if _locale_in_file != null and not _locale_in_file.is_empty() and _locale_in_file != get_locale():
		set_locale(_locale_in_file)
		Logger.log("load locale: " + str(get_locale()) + " from config file.")
		return
	
	# 使用默认地区作为地区配置
	var _default_locale = get_default_locale()
	if _default_locale != null and not _default_locale.is_empty() and _default_locale != get_locale():
		set_locale(_default_locale)
		Logger.log("load locale: " + str(get_locale()) + " with system locale.")
		return
		
	Logger.log("load locale: " + str(get_locale()) + " fallback.")
	pass
	
func get_locale() -> String:
	return TranslationServer.get_locale()
	
func set_locale(_locale : String) -> void:
	if _locale == null:
		return
	
	if not TranslationServer.get_loaded_locales().has(_locale):
		return 
	
	if get_locale() != _locale:
		TranslationServer.set_locale(_locale)
	
	# 持久化
	ConfigLoader.set_value(LOCALE_CONFIG_KEY, _locale)
	pass

# ======== 内部方法 =======
func _load_locale_from_file() -> String:
	var locale = ConfigLoader.load_value(LOCALE_CONFIG_KEY)
	if locale == null:
		return ""
	return locale as String
