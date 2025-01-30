extends Control
class_name SystemSetting

@export var menu_panel_ref : CanvasItem

var config_cache : Dictionary

func _ready() -> void:
	_init_data()
	pass

func show_settings(_menu_panel_ref : CanvasItem) -> void:
	menu_panel_ref = _menu_panel_ref
	show()
	pass

func _on_apply_button_pressed() -> void:
	var setting_elements = _get_setting_elements(self)
	var config = _load_config({}, setting_elements)
	if config != config_cache:
		config_cache = config
		_render_and_apply(config, setting_elements)
		SettingStoreUtil.save_config(config)
	hide()
	menu_panel_ref.show()
	menu_panel_ref = null
	pass

func _on_back_button_pressed() -> void:
	# 用cache渲染子节点
	var setting_elements = _get_setting_elements(self)
	_render_and_apply(config_cache, setting_elements)
	# 打开父节点
	hide()
	menu_panel_ref.show()
	menu_panel_ref = null
	pass

func _init_data() -> void:
	var setting_elements = _get_setting_elements(self)
	# 1. 如果文件不存在，加载默认配置，并写入文件
	if !SettingStoreUtil.config_file_exits():
		_init_config(setting_elements)
	# 2. 读取文件
	config_cache = SettingStoreUtil.load_config()
	# 3. 渲染数据 & 应用配置
	_render_and_apply(config_cache, setting_elements)
	pass

func _init_config(setting_elements : Array[SettingElements]) -> void:
	# 1. 获取所有section , key , value
	var config = _load_default_config({}, setting_elements)
	# 2. 保存到文件
	if !config.is_empty():
		SettingStoreUtil.save_config(config)
	pass

func _load_default_config(config : Dictionary, setting_elements : Array[SettingElements]) -> Dictionary:
	for child in setting_elements:
		if !config.has(child.section_name):
			config[child.section_name] = {child.store_key : child.default_value}
		else:
			config[child.section_name][child.store_key] = child.default_value
	return config

func _load_config(config : Dictionary, setting_elements : Array[SettingElements]) -> Dictionary:
	for child in setting_elements:
		if !config.has(child.section_name):
			config[child.section_name] = {child.store_key : child.get_value()}
		else:
			config[child.section_name][child.store_key] = child.get_value()
	return config

func _get_setting_elements(node : Node, setting_elements : Array[SettingElements] = []) -> Array[SettingElements]:
	for child in node.get_children(true):
		if child is SettingElements:
			setting_elements.append(child)
			_get_setting_elements(child, setting_elements)
		else:
			_get_setting_elements(child, setting_elements)
	return setting_elements

func _render_and_apply(config : Dictionary, setting_elements : Array[SettingElements]) -> void:
	for e in setting_elements:
		if config.has(e.section_name) and config[e.section_name].has(e.store_key):
			var value = config[e.section_name][e.store_key]
			e.render_data(value)
			e.apply_setting()
		else: 
			e.render_data()
			e.apply_setting()
	pass
