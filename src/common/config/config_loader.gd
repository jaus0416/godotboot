# 用于存储/加载配置
# 该工具默认配置文件是一个，如果希望多个，可以使用 ConfigFile 另外扩展 MultiConfigLoader
class_name ConfigLoader extends Node

# 默认存储路径
const DEFAULT_CONFIG_FILENAME = "system_setting.ini"
const DEFAULT_SECTION = "Settings"
# 存储文件名称
static var file_path : String = DEFAULT_CONFIG_FILENAME : set = _set_file_path
# 加密key
static var encrypt_key : PackedByteArray
# 加密密码
static var encrypt_password : String

# 存储配置
static func set_value(key: String, value: Variant, section: String = DEFAULT_SECTION) -> Error:
	var _config = ConfigFile.new()
	_load(_config)
	_config.set_value(section, key, value)
	return _save(_config)

# 加载配置
static func load_value(key: String, section: String = DEFAULT_SECTION) -> Variant:
	var _config = ConfigFile.new()
	if _load(_config) == OK:
		if _config.has_section_key(section, key):
			return _config.get_value(section, key)
	return null

# 是否包含配置
static func has_key(key: String, section: String = DEFAULT_SECTION) -> bool:
	var _config = ConfigFile.new()
	if _load(_config) == OK :
		return _config.has_section_key(section, key)
	else:
		return false
		
# 删除键
static func erase_section_key(key: String, section: String = DEFAULT_SECTION) -> void:
	var _config = ConfigFile.new()
	if _load(_config) == OK and _config.has_section_key(section, key):
		_config.erase_section_key(section, key)
		_save(_config)

# 删除section
static func erase_section(section: String = DEFAULT_SECTION) -> void:
	var _config = ConfigFile.new()
	if _load(_config) == OK and _config.has_section(section):
		_config.erase_section(section)
		_save(_config)


# ======== 内部方法 =======
static func _set_file_path(value : String) -> void:
	if file_path != null:
		file_path = value
	pass

static func _get_config_path() -> String: 
	return FileUtil.SAVE_PATH_PREFIX + file_path

static func _save(_config : ConfigFile, path : String = _get_config_path()) -> Error:
	if encrypt_key != null and encrypt_key.size() > 0:
		return _config.save_encrypted(path, encrypt_key)
	elif encrypt_password != null and not encrypt_password.is_empty():
		return _config.save_encrypted_pass(path, encrypt_password)
	else:
		return _config.save(path)

static func _load(_config : ConfigFile, path : String = _get_config_path()) -> Error:
	if encrypt_key != null and encrypt_key.size() > 0:
		return _config.load_encrypted(path, encrypt_key)
	elif encrypt_password != null and not encrypt_password.is_empty():
		return _config.load_encrypted_pass(path, encrypt_password)
	else:
		return _config.load(path)
