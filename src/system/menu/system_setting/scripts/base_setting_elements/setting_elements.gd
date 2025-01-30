extends Node
class_name SettingElements

@export var store_key : String = "default_key"
@export var default_value : String = "default_value"

var section_name : String = ""

func _ready() -> void:
	_init_section_name()
	pass

func render_data(_curr_value : String = default_value) -> void:
	pass

func apply_setting() -> void:
	pass

func _init_section_name() -> void:
	var node = self
	while node:
		if node is SettingSection:
			section_name = node.section_name
			break
		node = node.get_parent()
	pass

func get_value() -> String:
	return default_value
