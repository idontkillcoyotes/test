extends State

func enter() -> void:
	animator.play("guard")

func handle_input(event:InputEvent) -> void:
	if event.is_action_released("player_guard"):
		sm.transition_to("Idle")

func update(_delta:float) -> void:
	pass

func exit() -> void:
	pass
