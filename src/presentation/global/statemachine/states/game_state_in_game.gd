## 预加载
class_name GameStateInGame extends GameState

# 进入状态时调用
func enter(_params = null) -> void:
	Logger.log("[GameStateInGame] start in game ...")
	_exec()
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	Logger.log("[GameStateInGame] exit in game ...")
	pass

func _exec() -> void:
	# do nothing
	pass
