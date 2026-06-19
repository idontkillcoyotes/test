@abstract
class_name State
extends Node

var character : CharacterBody2D
var animator : AnimationPlayer
var sm : StateMachine

@abstract
func enter() -> void
	
@abstract
func exit() -> void

@abstract
func update(delta:float) -> void

@abstract
func handle_input(event:InputEvent) -> void
