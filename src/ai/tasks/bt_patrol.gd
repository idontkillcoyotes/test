class_name BTPatrol
extends BTAction

const PATROL_RADIUS: float = 100.0

var _target: Vector2 = Vector2.ZERO

func _enter() -> void:
	_target = agent.global_position + Vector2(
		randf_range(-PATROL_RADIUS, PATROL_RADIUS),
		randf_range(-PATROL_RADIUS, PATROL_RADIUS)
	)

func _tick(_delta: float) -> Status:
	var enemy: Soldier = agent as Soldier
	
	if enemy.global_position.distance_to(_target) < 10.0:
		return SUCCESS
	
	enemy.move_toward_target(_target)
	return RUNNING
