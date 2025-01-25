## 全局配置管理器
extends Node

var config_arr : Array[Configuration] = []

func _ready() -> void:
	_register_config()
	_init_config()
	pass
	
# 注册启动配置
func _register_config() -> void:
	# 本地化
	register(LocalizationConfig.new())
	pass

# 初始化启动配置
func _init_config() -> void:
	Logger.log("[InitConfig] start ...")
	if config_arr != null and config_arr.size() > 0:
		for _config in config_arr:
			if _config != null:
				_config.init()
	Logger.log("[InitConfig] finished ...")
	pass

## 注册配置
func register(config : Configuration) -> void:
	if config != null:
		config_arr.append(config)
	pass

## 取消注册配置
func unregister(config : Configuration) -> void:
	if config != null:
		config_arr.erase(config)
	pass
