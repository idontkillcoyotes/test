extends State

@export var damage : int = 10

var pressed_attack : bool = false

func enter() -> void:
	if not animator.animation_finished.is_connected(_on_animation_finished):
		animator.animation_finished.connect(_on_animation_finished)
	pressed_attack = false
	animator.play("attack")

func _on_animation_finished(_anim_name:String) -> void:
	if pressed_attack:
		sm.transition_to("Attack2")
	else:
		sm.transition_to("Idle")

func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("player_attack"):
		pressed_attack = true

func update(_delta:float) -> void:
	pass

func exit() -> void:
	pass
