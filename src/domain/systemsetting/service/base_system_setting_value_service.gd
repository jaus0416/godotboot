## 配置抽象类
class_name BaseSystemSettingValueService extends Node

# 初始化游戏配置
func _init() -> void:
	pass

# 重置配置
func reset() -> void:
	pass

func get_key() -> String:
	return ""

func get_value() -> Variant:
	return null

func get_default_value() -> Variant:
	return null

# 可选项： 中文 - zh， English -> en
func get_options() -> Dictionary:
	return {}

func get_config_value() -> SystemSettingValue:
	return null

func set_value(_value : Variant) -> void:
	pass

func check_value_type(_value : Variant) -> bool:
	return false
