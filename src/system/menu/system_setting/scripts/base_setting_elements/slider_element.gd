extends SettingElements
class_name SliderElement

# Default values for the element
@export var min_value: float = 0
@export var max_value: float = 10
@export var step_value: float = 1

@export var slider_ref : HSlider
@export var value_box_ref : Control


func _ready() -> void:
	super._ready()
	slider_ref.set_min(min_value)
	slider_ref.set_max(max_value)
	slider_ref.set_step(step_value)
	
	if value_box_ref is SpinBox:
		value_box_ref.set_min(min_value)
		value_box_ref.set_max(max_value)
		value_box_ref.set_step(step_value)
	
	slider_ref.connect("value_changed", slider_value_changed)
	value_box_ref.connect("value_changed", value_box_value_changed)
	pass

func render_data(_curr_value : String = default_value) -> void:
	slider_ref.value = float(_curr_value)
	update_valuebox(slider_ref.value)
	pass

func slider_value_changed(value: float) -> void:
	update_valuebox(value)
	pass

func update_valuebox(value: float) -> void:
	if value_box_ref is SpinBox:
		value_box_ref.set_value(value)
	else:
		value_box_ref.set_text(str(value))

func value_box_value_changed(value: float) -> void:
	slider_ref.set_value(value)

func get_value() -> String:
	return str(snappedf(slider_ref.get_value(), step_value))
