class_name Soldier
extends CharacterBody2D

const NAV_TARGET_DESIRED_DISTANCE : float = 20.0

@export var move_speed : float = 200.0
@export var attack_range : float = 50.0
@export_range(0.0,5.0) var attack_cooldown : float = 1.5
@export var detection_range : float = 200.0

@onready var weapon: Node2D = $Weapon
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animator: AnimationPlayer = $AnimationPlayer

var player : Player

var _attack_cd : float = 0.0
var is_attacking: bool = false

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = true
		weapon.scale = Vector2(-1,1)
	else:
		sprite.flip_h = false
		weapon.scale = Vector2.ONE
	
	if _attack_cd > 0.0:
		_attack_cd -= delta

func can_attack() -> bool:
	return _attack_cd <= 0.0

func play_run() -> void:
	animator.play("run")

func play_idle() -> void:
	animator.play("idle")

func move_toward_target(target_pos: Vector2) -> void:
	nav_agent.target_position = target_pos
	nav_agent.target_desired_distance = NAV_TARGET_DESIRED_DISTANCE
	var next_point: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = global_position.direction_to(next_point)
	velocity = direction * move_speed
	move_and_slide()

func attack() -> void:
	if is_attacking:
		return
	if _attack_cd > 0.0:
		return
	
	_attack_cd = attack_cooldown
	is_attacking = true
	animator.play("attack")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack":
		is_attacking = false


func _on_health_component_health_depleted() -> void:
	self.queue_free()
