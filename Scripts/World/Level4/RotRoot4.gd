extends Node2D

var player : RigidBody2D

var world_screen_center : Vector2 = Vector2(975.0, 550.0)
var center_to_player_dir : Vector2

export var max_rot_angle : float = 5.0
	
func _ready():
	player = get_node("Player")
	
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0.0,0.0))
	
func _physics_process(delta):
	center_to_player_dir = (player.global_position - world_screen_center).normalized()
	_update_gravity_dir()
	_update_world_angle(delta)

func _update_gravity_dir():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, -center_to_player_dir)
	
func _update_world_angle(delta):
	var angle_weight : float = (Vector2.RIGHT).dot(center_to_player_dir)
	rotation_degrees = lerp(rotation_degrees, angle_weight * max_rot_angle, 0.2)
	
