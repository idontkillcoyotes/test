class_name BTMoveToPlayer
extends BTAction

func _tick(_delta: float) -> Status:
	var enemy: Soldier = agent as Soldier
	
	if enemy.player == null:
		return FAILURE
	
	if enemy.player.is_dead:
		return FAILURE
	
	var distance: float = enemy.global_position.distance_to(enemy.player.global_position)
	if distance <= enemy.attack_range:
		return SUCCESS
	
	enemy.play_run()
	enemy.move_toward_target(enemy.player.global_position)
	return RUNNING
