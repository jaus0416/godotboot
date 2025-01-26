# 用于存储/加载配置
class_name SystemSettingPersistance extends Node

static var _instance : SystemSettingPersistance

# 默认存储路径
const DEFAULT_CONFIG_FILENAME = "system_setting.ini"
const DEFAULT_SECTION = "System Setting"
# 存储文件名称
var file_path : String = DEFAULT_CONFIG_FILENAME : set = _set_file_path
# 加密key
var encrypt_key : PackedByteArray
# 加密密码
var encrypt_password : String

# 单例，不要new
static func get_instance() -> SystemSettingPersistance:
	if _instance == null:
		_instance = new()
	return _instance

# 存储配置
func save_value(key: String, value: Variant, section: String = DEFAULT_SECTION) -> Error:
	var _config = ConfigFile.new()
	_load(_config)
	_config.set_value(section, key, value)
	return _save(_config)

# 批量存储配置
func batch_save_value(key_pairs : Dictionary, section: String = DEFAULT_SECTION) -> Error:
	if key_pairs == null or key_pairs.size() == 0:
		return OK
	var _config = ConfigFile.new()
	_load(_config)
	for key in key_pairs:
		if key != null and key_pairs[key] != null:
			_config.set_value(section, key, key_pairs[key])
	return _save(_config)
	

# 加载配置
func load_value(key: String, section: String = DEFAULT_SECTION) -> Variant:
	var _config = ConfigFile.new()
	if _load(_config) == OK:
		if _config.has_section_key(section, key):
			return _config.get_value(section, key)
	return null

# 是否包含配置
func has_key(key: String, section: String = DEFAULT_SECTION) -> bool:
	var _config = ConfigFile.new()
	if _load(_config) == OK :
		return _config.has_section_key(section, key)
	else:
		return false
		
# 删除键
func erase_section_key(key: String, section: String = DEFAULT_SECTION) -> void:
	var _config = ConfigFile.new()
	if _load(_config) == OK and _config.has_section_key(section, key):
		_config.erase_section_key(section, key)
		_save(_config)

# 删除section
func erase_section(section: String = DEFAULT_SECTION) -> void:
	var _config = ConfigFile.new()
	if _load(_config) == OK and _config.has_section(section):
		_config.erase_section(section)
		_save(_config)


# ======== 内部方法 =======
func _set_file_path(value : String) -> void:
	if file_path != null:
		file_path = value
	pass

func _get_config_path() -> String: 
	return FileUtil.SAVE_PATH_PREFIX + file_path

func _save(_config : ConfigFile, path : String = _get_config_path()) -> Error:
	if encrypt_key != null and encrypt_key.size() > 0:
		return _config.save_encrypted(path, encrypt_key)
	elif encrypt_password != null and not encrypt_password.is_empty():
		return _config.save_encrypted_pass(path, encrypt_password)
	else:
		return _config.save(path)

func _load(_config : ConfigFile, path : String = _get_config_path()) -> Error:
	if encrypt_key != null and encrypt_key.size() > 0:
		return _config.load_encrypted(path, encrypt_key)
	elif encrypt_password != null and not encrypt_password.is_empty():
		return _config.load_encrypted_pass(path, encrypt_password)
	else:
		return _config.load(path)
