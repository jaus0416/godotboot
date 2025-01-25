## 配置抽象类
class_name Configuration extends Node

# 初始化游戏配置
func init() -> void:
	pass

# 重置配置
func reset(
	_name : String = "" # 配置名，例如： locale
	) -> void:
	pass
