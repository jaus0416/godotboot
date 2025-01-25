## 日志打印工具类
## 后续打印日志都尽量使用这个类，不要直接使用print
class_name Logger extends Node

# 打印日志
# [2025-01-25 12:15:59]log
static func log(message : String = "") -> void:
	print(_get_timestamp() + message)
	pass

# 打印错误日志
# [2025-01-25 12:15:59]error
static func logerr(message : String = "") -> void:
	printerr(_get_timestamp() + message)
	pass

static func _get_timestamp() -> String:
	return "[" + Time.get_datetime_string_from_system(false, true) + "]"
