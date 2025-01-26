## 结束游戏
class_name GameStateEnd extends GameState

# 进入状态时调用
func enter(_params = null) -> void:
	Logger.log("[GameStateEnd] end game ...")
	Application.tree.quit()
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	pass
