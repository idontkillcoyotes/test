class_name HitboxComponent
extends Area2D

var damage_instance : DamageInstance

func _ready() -> void:
	if damage_instance == null:
		damage_instance = DamageInstance.new()
	
	damage_instance.source = owner
