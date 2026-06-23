class_name BTPatrol
extends BTAction

const PATROL_RADIUS: float = 100.0
const NEAR_DISTANCE: float = 25.0
const MAX_TIME_PATROL: float = 3.0

var _target: Vector2 = Vector2.ZERO

var _time : float = 0.0

func _enter() -> void:
	_target = agent.global_position + Vector2(
		randf_range(-PATROL_RADIUS, PATROL_RADIUS),
		randf_range(-PATROL_RADIUS, PATROL_RADIUS)
	)
	_time = 0.0

func _tick(delta: float) -> Status:
	_time += delta
	var enemy: Soldier = agent as Soldier
	
	if _time >= MAX_TIME_PATROL:
		enemy.play_idle()
		return FAILURE
	
	if enemy.global_position.distance_to(_target) < NEAR_DISTANCE:
		enemy.play_idle()
		return SUCCESS
	
	enemy.play_run()
	enemy.move_toward_target(_target)
	
	return RUNNING
