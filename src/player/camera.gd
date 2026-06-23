extends Camera2D

var _shake_duration: float = 0.0
var _shake_strength: float = 0.0

func _process(delta: float) -> void:
	if _shake_duration > 0.0:
		_shake_duration -= delta
		offset = Vector2(
			randf_range(-_shake_strength, _shake_strength),
			randf_range(-_shake_strength, _shake_strength)
		)
	else:
		offset = Vector2.ZERO

func shake(duration: float, strength: float) -> void:
	_shake_duration = duration
	_shake_strength = strength
