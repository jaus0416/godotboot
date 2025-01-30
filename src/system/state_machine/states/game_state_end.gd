## 结束游戏
extends GameState
class_name GameStateEnd

# 进入状态时调用
func enter(_params = null) -> void:
	GameManager.get_tree().quit()
	pass

# 状态更新时调用
func process(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	pass
