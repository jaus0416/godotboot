## 预加载
class_name GameStatePreboot extends GameState

# 进入状态时调用
func enter(_params = null) -> void:
	Logger.log("[GameStatePreboot] start preboot ...")
	_exec()
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	Logger.log("[GameStatePreboot] exit preboot ...")
	pass

func _exec() -> void:
	# do nothing
	pass
