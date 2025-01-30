extends Control
class_name StartMenu


func _on_exit_pressed() -> void:
	GameManager.exit_game()
	pass


func _on_start_game_pressed() -> void:
	pass


func _on_setting_pressed() -> void:
	UIManager.show_system_setting(self)
	pass
