class_name Spike
extends Node2D

@onready var state_machine: StateMachine = $StateMachine

func _on_health_component_health_depleted() -> void:
	self.queue_free()


func _on_health_component_health_changed(new_value: int) -> void:
	state_machine.transition_to("Hit")
