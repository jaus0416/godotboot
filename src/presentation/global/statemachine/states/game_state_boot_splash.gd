## 预加载
class_name GameStateBootSplash extends GameState

# 进入状态时调用
func enter(_params = null) -> void:
	Logger.log("[GameStateBootSplash] start boot splash ...")
	_exec()
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	Logger.log("[GameStateBootSplash] exit boot splash ...")
	pass

func _exec() -> void:
	# do nothing
	pass
