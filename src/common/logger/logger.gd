@tool
extends Node
## 日志打印工具类
## 后续打印日志都尽量使用这个类，不要直接使用print
class_name Logger

const LOG_MESSAGE_FORMAT = "{date} {level} {message}"

enum LogLevel {
	DEFAULT,
	DEBUG,
	INFO,
	WARN,
	ERROR,
	FATAL,
}

static var _instance : Logger = Logger.new()

static func info(message : String) -> void:
	_instance.call_thread_safe("_internal_log", message, LogLevel.INFO)
	pass

static func error(message : String = "") -> void:
	_instance.call_thread_safe("_internal_log", message, LogLevel.ERROR)
	pass

# internal functions
static func _get_timestamp() -> String:
	return "[" + Time.get_datetime_string_from_system(false, true) + "]"

static func _internal_log(message : String, log_level := LogLevel.INFO) -> void:
	var format_data = {
		"message" : message,
		"level" : LogLevel.keys()[log_level],
		"date" : _get_timestamp()
	}
	var msg = String(LOG_MESSAGE_FORMAT).format(format_data)
	match log_level:
		LogLevel.DEBUG:
			print_rich("[color=gray]" + msg + "[/color]")
		LogLevel.INFO:
			print(msg)
		LogLevel.WARN:
			print_rich("[color=yellow]" + msg + "[/color]")
		LogLevel.ERROR:
			push_error(msg)
			printerr(msg)
		LogLevel.FATAL:
			push_error(msg)
			printerr(msg)
		_:
			printerr("invalid log level：", log_level)
	pass
