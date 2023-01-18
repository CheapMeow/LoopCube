extends RigidBody2D

func _process(delta):
	var colliders : Array = get_colliding_bodies()
	for collider in colliders:
		if collider.name == "Player":
			finish_level()
		
func finish_level():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2.DOWN)
	GlobalLevelConst.game_root.scene_manager.load_salute()
