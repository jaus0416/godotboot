# 控制整个游戏的生命周期
extends Node
class_name GameStateMachine

static var _instance : GameStateMachine = GameStateMachine.new()
var current_state : GameState = null
var current_state_name : StateName
var prev_state_name : StateName
var states = {}

enum StateName {
	NOT_START,
	PREBOOT,
	BOOTING,
	BOOT_SPLASH,
	START_MENU,
	IN_GAME,
	PAUSE_MENU,
	END,
}

# 开始游戏
static func run() -> void:
	# 开始轮转
	_instance._run()
	pass

# 结束游戏
static func exit() -> void:
	_instance._exit()
	pass

# 轮转状态 
static func change_state(state_name : StateName, params = null):
	_instance._change_state(state_name, params)
	pass

# ========== 内部方法 ========== 
func _init() -> void:
	# 注册所有状态
	register_state(StateName.PREBOOT, preload("./states/game_state_preboot.gd").new())
	register_state(StateName.BOOTING, preload("./states/game_state_booting.gd").new())
	register_state(StateName.BOOT_SPLASH, preload("./states/game_state_boot_splash.gd").new())
	register_state(StateName.START_MENU, preload("./states/game_state_start_menu.gd").new())
	register_state(StateName.IN_GAME, preload("./states/game_state_in_game.gd").new())
	register_state(StateName.PAUSE_MENU, preload("./states/game_state_pause_menu.gd").new())
	register_state(StateName.END, preload("./states/game_state_end.gd").new())
	pass

func _run() -> void:
	# 1. preboot
	_change_state(StateName.PREBOOT)
	# 2. booting
	_change_state(StateName.BOOTING)
	# 3. splash
	_change_state(StateName.BOOT_SPLASH)
	# 4. start menu
	_change_state(StateName.START_MENU)
	pass

func _exit() -> void:
	# exit
	_change_state(StateName.END)
	pass

func register_state(state_name : StateName, state_instance : GameState):
	states[state_name] = state_instance
	add_child(state_instance)
	pass

func _change_state(state_name : StateName, params = null):
	if current_state:
		prev_state_name = current_state_name
		current_state.exit()
	current_state = states[state_name]
	current_state_name = state_name
	current_state.enter(params)
	# log
	var format = "[GameStateMachine] change state : from : {from} , to : {to}"
	var format_data = {
		"from" : StateName.find_key(prev_state_name),
		"to" : StateName.find_key(current_state_name)
	}
	Logger.info(format.format(format_data))
	pass

func _process(delta : float):
	if current_state:
		current_state.process(delta)
