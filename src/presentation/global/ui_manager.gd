## 管理系统级别的场景
extends Node

const SYSTEM_SETTING = preload("res://src/presentation/system/systemsetting/system_setting_scene.tscn")
const START_MENU = preload("res://src/presentation/system/startmenu/start_menu_scene.tscn")
const SCENE_TRANSITION = preload("res://src/presentation/global/scenetransition/scene_transition.tscn")

var system_setting : SystemSettingScene
var start_menu : StartMenuScene
var scene_transition : SceneTransition
	
func _ready() -> void:
	Logger.log("[UIManager]init UIManager ...")
	system_setting = SYSTEM_SETTING.instantiate()
	start_menu = START_MENU.instantiate()
	scene_transition = SCENE_TRANSITION.instantiate()
	add_child(scene_transition)
	pass

func show_system_setting() -> void:
	_change_scene(SYSTEM_SETTING.resource_path)
	pass

func show_start_menu() -> void:
	_change_scene(START_MENU.resource_path, false)
	pass

# need_transition: 是否需要转场动画
func _change_scene(scene_path : String, need_transition: bool = true) -> void:
	# 1. pause
	var _tree : SceneTree = Application.tree
	_tree.paused = true
	# 2. fade out
	if need_transition:
		await scene_transition.fade_out()
	# 3. change scene
	await _tree.process_frame
	_tree.change_scene_to_file(scene_path)
	await _tree.process_frame
	# 4. fade in
	if need_transition:
		await scene_transition.fade_in()
	# 5. start
	_tree.paused = false
	pass
