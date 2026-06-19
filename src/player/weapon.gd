class_name PlayerWeapon
extends Node2D

@export var damage : int = 10
@export var knockback_force : float = 100
@export var hitbox : HitboxComponent

func _ready() -> void:
	if hitbox:
		var instance = DamageInstance.new(damage)
		instance.knockback_force = knockback_force
		instance.source = owner
		hitbox.damage_instance = instance
