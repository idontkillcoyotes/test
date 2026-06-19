class_name DamageInstance
extends Object

var damage : int = 0
var knockback_force : float = 0
var source : Node2D

func _init(value:int=1) -> void:
	damage = value

func get_damage() -> int:
	return damage

func _to_string() -> String:
	var s:= "DamageInstance: "
	s+="(%d)/(%.2f)[%s]"%[damage,knockback_force,source.name]
	return s
