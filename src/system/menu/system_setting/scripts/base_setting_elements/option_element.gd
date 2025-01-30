extends SettingElements
class_name OptionElement

@export var option_ref : OptionButton

var option_list : Dictionary
var localization_list : Dictionary

func _ready() -> void:
	super._ready()
	option_ref.connect("item_selected", option_selected)
	pass
	
func render_data(_curr_value : String = default_value) -> void:
	option_ref.clear()
	var index : int = 0
	for option in option_list:
		add_item(option, index)
		if option == _curr_value:
			option_ref.select(index)
		index += 1
	pass

func add_item(option, index):
	if localization_list:
		option_ref.add_item(localization_list[option], index)
		option_ref.set_item_metadata(index, option)
	else:
		option_ref.add_item(option, index)
	pass

func get_value() -> String:
	if localization_list:
		return option_ref.get_selected_metadata()
	else:
		var index = option_ref.get_selected_id()
		if index < 0:
			return ""
		return option_ref.get_item_text(index)

func option_selected(_index: int) -> void:
	apply_setting()
	pass
