## 全局配置管理器
## 主要用于配置初始化，也可以从 config_arr中获取配置单例
extends Node

enum CONFIG_KEYS {
	LocalizationConfig,
}

var configs = {}

func _ready() -> void:
	_register_config()
	_init_config()
	pass
	
# 注册启动配置
func _register_config() -> void:
	# 本地化
	register(CONFIG_KEYS.LocalizationConfig, LocalizationConfig.new())
	pass

# 初始化启动配置
func _init_config() -> void:
	Logger.log("[InitConfig] start ...")
	if configs != null and configs.size() > 0:
		for _config in configs.values():
			if _config != null:
				_config.init()
	Logger.log("[InitConfig] finished ...")
	pass

## 注册配置
func register(key : CONFIG_KEYS, config : Configuration) -> void:
	if config != null:
		configs[key] = config
	pass

## 取消注册配置
func unregister(key : CONFIG_KEYS) -> void:
	if key != null:
		configs.erase(key)
	pass

## 获取配置类
func get_configuration(key : CONFIG_KEYS) -> Configuration:
	return configs.get(key)
