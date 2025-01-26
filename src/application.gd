class_name Application extends Node

static var tree

# start world
func _ready() -> void:
	init()
	start()
	pass

static func start() -> void:
	Logger.log("[Application] start game ...")
	GameStateMachine.run()
	pass

static func exit() -> void:
	#Logger.log("debug: " + str(tree))
	Logger.log("[Application] exit game ...")
	GameStateMachine.exit()
	pass

func init() -> void:
	tree = get_tree()
	pass
