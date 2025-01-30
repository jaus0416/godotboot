## 管理游戏整个生命周期
extends Node
class_name GameState 

# 进入状态时调用
func enter(_params = null) -> void:
	pass

# 状态更新时调用
func process(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	pass
