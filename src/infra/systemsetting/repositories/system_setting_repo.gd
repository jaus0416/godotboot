class_name SystemSettingRepo extends Node

static var _instance : SystemSettingRepo

var persistance : SystemSettingPersistance = SystemSettingPersistance.get_instance()

static func get_instance() -> SystemSettingRepo:
	if _instance == null:
		_instance = new()
	return _instance
	
# 存储配置
func save_value(key: String, value: Variant) -> void:
	var result = persistance.save_value(key, value)
	if result != OK:
		Logger.logerr("batch_save_value error: result: " + result + ", key: " + key + ", value: " + str(value))
	pass

func set_value(key: String, value: Variant) -> void:
	save_value(key, value)
	pass

# 批量存储配置
func batch_save_value(key_pairs : Dictionary) -> void:
	var result = persistance.batch_save_value(key_pairs)
	if result != OK:
		Logger.logerr("batch_save_value error : result: " + result + ", data: " + str(key_pairs))
	pass
	

# 加载配置
func load_value(key: String) -> Variant:
	return persistance.load_value(key)

# 是否包含配置
func has_key(key: String) -> bool:
	return persistance.has_key(key)
