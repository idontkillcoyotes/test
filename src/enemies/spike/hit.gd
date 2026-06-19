extends State

func enter() -> void:
	animator.play("hit")
	await animator.animation_finished
	sm.transition_to("Idle")

func handle_input(_event:InputEvent) -> void:
	pass

func update(delta:float) -> void:
	pass

func exit() -> void:
	pass
