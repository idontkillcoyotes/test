class_name KnockbackComponent
extends Node

const MAX_KNOCKBACK : float = 100.0

@export var character : CharacterBody2D
@export var hurtbox : HurtboxComponent

@export var decay : float = 400.0

var _knockback : Vector2 = Vector2.ZERO

func _ready() -> void:
	if hurtbox:
		hurtbox.hit_received.connect(_on_hit_received)

func _on_hit_received(instance:DamageInstance) -> void:
	if character == null:
		return
	
	_knockback = Vector2.ZERO
	
	if instance.knockback_force > 0 and instance.source != null:
		var enemy_pos : Vector2 = instance.source.global_position
		var direction : Vector2 = (enemy_pos.direction_to(character.global_position))
		_knockback = direction * instance.knockback_force
		_knockback = _knockback.limit_length(MAX_KNOCKBACK)

func _physics_process(delta: float) -> void:
	apply(delta)

func apply(delta) -> void:
	if character == null:
		return
	
	if _knockback.is_zero_approx():
		_knockback = Vector2.ZERO
		return
	
	_knockback = _knockback.move_toward(Vector2.ZERO, decay * delta)
	character.velocity += _knockback
	character.move_and_slide()
	
