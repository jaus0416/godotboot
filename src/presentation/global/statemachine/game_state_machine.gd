## 管理整个游戏的生命周期
class_name GameStateMachine extends Node

static var _instance : GameStateMachine
var current_state : GameState = null
var states = {}

enum StateName {
	PREBOOT,
	BOOTING,
	BOOT_SPLASH,
	START_MENU,
	IN_GAME,
	PAUSE_MENU,
	END,
}

func _init():
	# 注册所有状态
	register_state(StateName.PREBOOT, preload("res://src/presentation/global/statemachine/states/game_state_preboot.gd").new())
	register_state(StateName.BOOTING, preload("res://src/presentation/global/statemachine/states/game_state_booting.gd").new())
	register_state(StateName.BOOT_SPLASH, preload("res://src/presentation/global/statemachine/states/game_state_boot_splash.gd").new())
	register_state(StateName.START_MENU, preload("res://src/presentation/global/statemachine/states/game_state_start_menu.gd").new())
	register_state(StateName.IN_GAME, preload("res://src/presentation/global/statemachine/states/game_state_in_game.gd").new())
	register_state(StateName.PAUSE_MENU, preload("res://src/presentation/global/statemachine/states/game_state_pause_menu.gd").new())
	register_state(StateName.END, preload("res://src/presentation/global/statemachine/states/game_state_end.gd").new())
	pass

# 开始游戏
static func run() -> void:
	if _instance == null:
		_instance = new()
		
	# 开始轮转
	_instance._run()
	pass

# 结束游戏
static func exit() -> void:
	_instance._exit()
	pass

func _run() -> void:
	# 1. preboot
	change_state(StateName.PREBOOT)
	# 2. booting
	change_state(StateName.BOOTING)
	# 3. splash
	change_state(StateName.BOOT_SPLASH)
	# 4. start menu
	change_state(StateName.START_MENU)
	pass

func _exit() -> void:
	# exit
	change_state(StateName.END)
	pass

func register_state(state_name, state_instance):
	states[state_name] = state_instance
	add_child(state_instance)
	pass

func change_state(state_name, params = null):
	if current_state:
		current_state.exit()
	current_state = states[state_name]
	current_state.enter(params)
	pass

func _process(delta):
	if current_state:
		current_state.update(delta)
