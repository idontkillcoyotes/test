extends State

func enter() -> void:
	animator.play("hit")
	character.camera.shake(0.333,5)
	await animator.animation_finished
	sm.transition_to("Idle")

func handle_input(_event:InputEvent) -> void:
	pass

func update(_delta:float) -> void:
	pass

func exit() -> void:
	pass
