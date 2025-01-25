class_name ConfigService extends Node

var _config : Config = Config.new()
var _config_service_mapping : Dictionary = {}
static var _instance : ConfigService

# 单例，不要new
static func get_instance() -> ConfigService:
	if _instance == null:
		new()
		_instance.init()
	return _instance

func _init() -> void:
	# 注册所有service
	_register_service(LocalizationConfigService.get_instace()) # 本地化
	# 初始化config的值
	_refresh_config()
	pass

func get_config() -> Config:
	return _config

# ========== 内部工具 ==========
## 注册配置
func _register_service(service : BaseConfigValueService) -> void:
	if service == null:
		return
	if service.get_key() == null || service.get_key().is_empty():
		return
	_config_service_mapping[service.get_key()] = service
	pass

func _refresh_config() -> void:
	if _config_service_mapping.is_empty():
		return
	
	for _service in _config_service_mapping.values():
		_config.add(_service.get_config())
	pass
