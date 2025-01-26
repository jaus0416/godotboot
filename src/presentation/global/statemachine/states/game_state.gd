## 管理游戏整个生命周期
class_name GameState extends Node

# 进入状态时调用
func enter(_params = null) -> void:
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	pass
