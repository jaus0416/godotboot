## 系统配置聚合根
class_name SystemSetting extends Node

# 全部配置
var config_item = {}

## 注册配置
func add(config : SystemSettingValue) -> void:
	if config != null:
		config_item[config.key] = config
	pass

## 取消注册配置
func erase(key : String) -> void:
	if key != null:
		config_item.erase(key)
	pass

## 获取配置类
func get_config(key : String) -> SystemSettingValue:
	return config_item.get(key)

func _to_string() -> String:
	return str(config_item)
