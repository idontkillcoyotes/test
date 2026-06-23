class_name BTIsPlayerDetected
extends BTCondition

func _tick(_delta: float) -> Status:
	var enemy: Soldier = agent as Soldier
	
	if enemy.player == null:
		return FAILURE
	
	if enemy.player.is_dead:
		return FAILURE
	
	var distance: float = enemy.global_position.distance_to(enemy.player.global_position)

	if distance <= enemy.detection_range:
		return SUCCESS
	else:
		return FAILURE
