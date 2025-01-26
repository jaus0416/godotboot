class_name SystemSettingValue extends Node

var key : String = "default_key"
var value

func _to_string() -> String:
	return str({key : value})
