## 管理所有全局菜单（开始菜单、暂停菜单、设置页面、转场动画等）
extends Node

var resource_system_setting = preload("../menu/system_setting/scenes/system_setting.tscn")
var resource_start_menu = preload("../menu/start_menu/scenes/start_menu.tscn")

var start_menu : Control
var system_setting : SystemSetting

func _ready() -> void:
	Logger.info("[UIManager] init UIManager ... ")
	system_setting = resource_system_setting.instantiate()
	start_menu = resource_start_menu.instantiate()
	
	add_child(system_setting)
	pass

func show_start_menu() -> void:
	_change_scene(resource_start_menu.resource_path)
	pass

func show_system_setting(menu_ref : CanvasItem) -> void:
	menu_ref.hide()
	system_setting.show_settings(menu_ref)
	pass

# need_transition: 是否需要转场动画
func _change_scene(scene_path : String) -> void:
	# 1. pause
	get_tree().paused = true
	# 2. change scene
	await get_tree().process_frame
	get_tree().change_scene_to_file(scene_path)
	await get_tree().process_frame
	# 3. start
	get_tree().paused = false
	pass
