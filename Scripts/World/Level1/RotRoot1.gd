extends Node2D

onready var player = get_parent().get_node("Player")
onready var blueCube = get_node("BlueCube")

func _physics_process(delta):
	var player_to_cube_dir : Vector2 = (blueCube.global_position - player.global_position).normalized()
	var root_to_cube_dir : Vector2 = (blueCube.global_position - global_position).normalized()
	
	var cross : float = root_to_cube_dir.cross(player_to_cube_dir)
#
	rotation += cross/80.0
