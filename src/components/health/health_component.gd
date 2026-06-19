class_name HealthComponent
extends Node

signal health_changed(new_value:int)
signal health_depleted

@export var max_health : int = 100

var current_health : int 

func _ready() -> void:
	current_health = max_health

func take_damage(instance: DamageInstance) -> void:
	var damage = instance.get_damage()
	current_health = clampi(current_health - damage, 0, max_health)
	health_changed.emit(current_health)
	if current_health == 0:
		health_depleted.emit()

func is_dead() -> bool:
	return current_health == 0
