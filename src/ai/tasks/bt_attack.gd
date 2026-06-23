class_name BTAttack
extends BTAction

func _tick(_delta: float) -> Status:
	var enemy: Soldier = agent as Soldier

	if enemy.is_attacking:
		return RUNNING
	
	var distance: float = enemy.global_position.distance_to(enemy.player.global_position)
	if distance > enemy.attack_range:
		return FAILURE
	
	enemy.attack()
	return SUCCESS
