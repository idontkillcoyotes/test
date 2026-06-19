class_name Soldier
extends CharacterBody2D

@export var move_speed : float = 200
@export var attack_range : float = 50
@export var detection_range : float = 200

@onready var weapon: Node2D = $Weapon
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

var player : Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(_delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = true
		weapon.scale = Vector2(-1,1)
	else:
		sprite.flip_h = false
		weapon.scale = Vector2.ONE

func move_toward_target(target_pos: Vector2) -> void:
	nav_agent.target_position = target_pos
	var next_point: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = global_position.direction_to(next_point)
	velocity = direction * move_speed
	move_and_slide()
