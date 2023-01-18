extends RigidBody2D

var input_dir : Vector2 = Vector2.ZERO

export var speed : float = 200.0

export var hit_effect_play_radius : float = 15.0

onready var _fx_player: FXPlayer = GlobalLevelConst.game_root.get_node("FXPlayer")
var collision_sound = preload("res://Assets/Sound/FX/wall_collision.wav")

onready var hit_effect = get_parent().get_node("HitEffect")

func _ready():
	connect("body_entered", self, "play_collision_fx")
	connect("body_entered", self, "play_hit_effect")
	
func _input(event: InputEvent):
	var move_x : float = Input.get_axis("move_left", "move_right")
	var move_y : float = Input.get_axis("move_up", "move_down")
	input_dir = Vector2(move_x, move_y).normalized()

func _integrate_forces(state):
	if input_dir != Vector2.ZERO:
		linear_velocity = lerp(linear_velocity, input_dir * speed, 0.1)

func play_collision_fx(node):
	_fx_player.play(collision_sound)

func play_hit_effect(node):
	var normal : Vector2 = (global_position - node.global_position).normalized()
	hit_effect.global_position = global_position
	hit_effect.rotation = (Vector2.RIGHT).angle_to(normal)
	if hit_effect.has_method("play_effect_once"):
		hit_effect.play_effect_once()
