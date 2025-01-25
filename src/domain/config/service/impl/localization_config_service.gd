## 本地化相关工具
class_name LocalizationConfigService extends BaseConfigValueService

static var _instance : LocalizationConfigService

const LOCALE_CONFIG_KEY = "locale"

var repo : ConfigRepo = ConfigRepo.get_instance()

static func get_instace() -> LocalizationConfigService:
	if _instance == null:
		_instance = new()
		_instance._init()
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

func get_config() -> ConfigValue:
	var config = ConfigValue.new()
	config.key = get_key()
	config.value = get_value()
	return config

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
	if _locale_in_file != null and not _locale_in_file.is_empty() and _locale_in_file != get_value():
		set_value(_locale_in_file)
		Logger.log("load locale: " + str(get_value()) + " from config file.")
		return
	
	# 使用默认地区作为地区配置
	var _default_locale = LocaleUtil.get_default_locale()
	if _default_locale != null and not _default_locale.is_empty() and _default_locale != get_value():
		set_value(_default_locale)
		Logger.log("load locale: " + str(get_value()) + " with system locale.")
		return
		
	Logger.log("load locale: " + str(get_value()) + " fallback.")
	pass
	
func _load_locale_from_file() -> String:
	var locale = repo.load_value(LOCALE_CONFIG_KEY)
	if locale == null:
		return ""
	return locale as String
