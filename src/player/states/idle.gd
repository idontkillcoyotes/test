# Player idle
extends State

func enter() -> void:
	animator.play("idle")

func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("player_attack"):
		sm.transition_to("Attack")

func update(_delta:float) -> void:
	var direction := Vector2(
		Input.get_axis("player_left", "player_right"),
		Input.get_axis("player_up", "player_down")
	)
	if not direction.is_zero_approx():
		sm.transition_to("Run")

func exit() -> void:
	pass
