extends SliderElement

@export var audio_bus: String


func _apply_settings() -> void:
	var busIndex: int = AudioServer.get_bus_index(audio_bus)
	
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(float(get_value())))
