extends Node2D


func _on_player_died() -> void:
	await get_tree().create_timer(3).timeout
	get_tree().reload_current_scene()
