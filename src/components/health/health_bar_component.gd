class_name HealthBar
extends ProgressBar

@export var health_component : HealthComponent

func _ready() -> void:
	if health_component:
		max_value = health_component.max_health
		value = max_value
		health_component.health_changed.connect(_on_health_changed)

func _on_health_changed(new_value: float) -> void:
	value = new_value
	
