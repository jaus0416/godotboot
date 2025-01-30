# 用于读写配置
extends Node
class_name SettingStoreUtil

const CONFIG_PATH = "user://system_setting.ini"

static func load_config() -> Dictionary:
	var _config = ConfigFile.new()
	var config_data = {}
	if !config_file_exits():
		return config_data
	_config.load(CONFIG_PATH)
	for section in _config.get_sections():
		for key in _config.get_section_keys(section):
			if config_data.has(section):
				config_data[section][key] = _config.get_value(section, key)
			else:
				config_data[section] = {key : _config.get_value(section, key)}
	return config_data

static func config_file_exits() -> bool:
	var path = CONFIG_PATH
	return FileAccess.file_exists(path)

static func save_config(config_data : Dictionary) -> void:
	var _config = ConfigFile.new()
	for section in config_data:
		for key in config_data[section]:
			_config.set_value(section, key, config_data[section][key])
	_config.save(CONFIG_PATH)
	pass
