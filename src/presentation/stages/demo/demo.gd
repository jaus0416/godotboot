extends Node2D

# TODO: for test
func _ready() -> void:
	var config = ConfigFile.new()
	print("load: " + error_string(ConfigLoader._load(config)))
	ConfigLoader.set_value("test1", "1")
	print("load: " + str(ConfigLoader.load_value("test1")))
	ConfigLoader.erase_section()
	pass
