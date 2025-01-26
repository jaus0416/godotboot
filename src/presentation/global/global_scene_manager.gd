## 管理系统级别的场景
extends Node

const SYSTEM_SETTING_SCENE = preload("res://src/presentation/system/systemsetting/system_setting_scene.tscn")

var system_setting : SystemSettingScene

func _ready() -> void:
	Logger.log("[GlobalSceneManager]system_setting: " + system_setting.name)
	pass

func _init() -> void:
	Logger.log("[GlobalSceneManager]init system scene ...")
	system_setting = SYSTEM_SETTING_SCENE.instantiate()
	pass

func show_system_setting() -> void:
	
	print("get_tree: >>> " + str(get_tree()) )
	print("path: " + str(SYSTEM_SETTING_SCENE.resource_path))
	await get_tree().process_frame
	get_tree().change_scene_to_file(SYSTEM_SETTING_SCENE.resource_path)
	system_setting.show_system_setting()
	pass
