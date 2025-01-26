## 本地化相关工具
class_name LocalizationSystemSettingService extends BaseSystemSettingValueService

static var _instance : LocalizationSystemSettingService

const LOCALE_CONFIG_KEY = "locale"

var repo : SystemSettingRepo = SystemSettingRepo.get_instance()

static func get_instace() -> LocalizationSystemSettingService:
	if _instance == null:
		_instance = new()
	return _instance

func _init() -> void:
	_init_locale()
	pass

func reset() -> void:
	var _default_locale = LocaleUtil.get_default_locale()
	set_value(_default_locale)
	pass

func get_key() -> String:
	return LOCALE_CONFIG_KEY

func get_value() -> Variant:
	return TranslationServer.get_locale()

func get_default_value() -> Variant:
	return LocaleUtil.get_default_locale()

func get_config() -> SystemSettingValue:
	var config = SystemSettingValue.new()
	config.key = get_key()
	config.value = get_value()
	return config

func get_options() -> Dictionary:
	var _options = {}
	if TranslationServer.get_loaded_locales().is_empty():
		return _options
	for i in TranslationServer.get_loaded_locales():
		var _display_name = LocaleUtil.LANGUAGE_MAP.get(i) as String
		if _display_name == null or _display_name.is_empty():
			continue
		_options[_display_name] = i
	return _options

func set_value(value : Variant) -> void:
	if value == null:
		return
	
	if not TranslationServer.get_loaded_locales().has(value):
		return 
	
	if get_value() != value:
		TranslationServer.set_locale(value)
	
	# 持久化
	repo.set_value(LOCALE_CONFIG_KEY, value)
	pass

func check_value_type(value : Variant) -> bool:
	if value == null:
		return false
	return value is String

# ======== 内部方法 =======
func _init_locale() -> void:
	# 读取配置文件
	var _locale_in_file = _load_locale_from_file()
	if _locale_in_file != null and not _locale_in_file.is_empty(): 
		if _locale_in_file != get_value():
			set_value(_locale_in_file)
		Logger.log("[SystemSetting]load locale: " + str(get_value()) + " from config file.")
		return
	
	# 使用默认地区作为地区配置
	var _default_locale = LocaleUtil.get_default_locale()
	if _default_locale != null and not _default_locale.is_empty():
		if _default_locale != get_value():
			set_value(_default_locale)
		Logger.log("[SystemSetting]load locale: " + str(get_value()) + " with system locale.")
		return
	
	set_value(get_value())
	Logger.log("[SystemSetting]load locale: " + str(get_value()) + " fallback.")
	pass
	
func _load_locale_from_file() -> String:
	var locale = repo.load_value(LOCALE_CONFIG_KEY)
	if locale == null:
		return ""
	return locale as String
