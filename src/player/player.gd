class_name Player
extends CharacterBody2D

signal damaged
signal died

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var weapon: Node2D = $Weapon
@onready var state_machine: StateMachine = $StateMachine

func _process(_delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = true
		weapon.scale = Vector2(-1,1)
	else:
		sprite.flip_h = false
		weapon.scale = Vector2.ONE

func _on_health_component_health_changed(new_value: int) -> void:
	if new_value > 0:
		state_machine.transition_to("Hit")
		damaged.emit()

func _on_health_component_health_depleted() -> void:
	state_machine.transition_to("Dead")
	died.emit()
