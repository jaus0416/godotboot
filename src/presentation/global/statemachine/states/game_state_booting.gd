## 加载游戏
class_name GameStateBooing extends GameState

# 进入状态时调用
func enter(_params = null) -> void:
	Logger.log("[GameStateBooing] start booting ...")
	_exec()
	pass

# 状态更新时调用
func update(_delta : float) -> void:
	pass

# 退出状态时调用
func exit():
	Logger.log("[GameStateBooing] exit booting ...")
	pass

func _exec() -> void:
	# 加载所有系统配置
	SystemSettingController.get_instance()
	pass
