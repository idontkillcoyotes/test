class_name HurtboxComponent
extends Area2D

@export var health_component : HealthComponent

signal hit_received(damage_instance: DamageInstance)

func _on_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		hit_received.emit(area.damage_instance)
		if health_component:
			health_component.take_damage(area.damage_instance)
