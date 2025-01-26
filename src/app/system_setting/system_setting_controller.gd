class_name SystemSettingController extends Node

static var _instance : SystemSettingController

var _service : SystemSettingService = SystemSettingService.get_instance()

static func get_instance() -> SystemSettingController:
	if _instance == null:
		_instance = new()
		return _instance
	return _instance
