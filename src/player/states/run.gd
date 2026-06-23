extends State

@export var move_speed : float = 200.0

func enter() -> void:
	animator.play("run")

func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("player_attack"):
		sm.transition_to("Attack")
	if event.is_action_pressed("player_guard"):
		sm.transition_to("Guard")

func update(_delta:float) -> void:
	var direction := Vector2(
		Input.get_axis("player_left", "player_right"),
		Input.get_axis("player_up", "player_down")
	)
	if direction.is_zero_approx():
		sm.transition_to("Idle")
	
	character.velocity = direction * move_speed
	character.move_and_slide()

func exit() -> void:
	pass
