## 配置抽象类
class_name BaseConfigValueService extends Node

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

func get_config_value() -> ConfigValue:
	return null

func set_value(value : Variant) -> void:
	pass

func check_value_type(value : Variant) -> bool:
	return false
