class_name StateMachine
extends Node

@export var character : CharacterBody2D
@export var animator : AnimationPlayer
@export var initial_state : State

@export_group("DEBUG")
@export var print_debug : bool = false

var current_state : State

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.character = character
			child.animator = animator
			child.sm = self
	
	current_state = initial_state
	current_state.enter()

func transition_to(new_state:String) -> void:
	var next_state : State
	next_state = get_node_or_null(new_state)
	
	if next_state == null:
		return
	
	if next_state == current_state:
		return
	
	if print_debug:
		print(current_state.name," -> ",next_state.name)
	current_state.exit()
	current_state = next_state
	current_state.enter()

func _physics_process(delta: float) -> void:
	current_state.update(delta)

func _input(event: InputEvent) -> void:
	current_state.handle_input(event)
