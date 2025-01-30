## 管理整个游戏系统
extends Node

func _ready() -> void:
	start_game()
	pass

func start_game() -> void:
	Logger.info("[GameManager] start game ...")
	GameStateMachine.run()
	pass

func exit_game() -> void:
	Logger.info("[GameManager] exit game ...")
	GameStateMachine.exit()
	pass
