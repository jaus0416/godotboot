## 暂停
extends GameState
class_name GameStateStartMenu

# 进入状态时调用
func enter(_params = null) -> void:
	UIManager.show_start_menu()
	pass

# 状态更新时调用
func process(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	pass
