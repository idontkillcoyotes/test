class_name BTMoveToPlayer 
extends BTAction

func _tick(_delta: float) -> Status:
	var enemy: Soldier = agent as Soldier
	
	if enemy.player == null:
		return FAILURE
	
	enemy.move_toward_target(enemy.player.global_position)
	return RUNNING
