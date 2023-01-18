extends Area2D

func _ready():
	connect("body_entered", self, "check_player_enter")

func check_player_enter(node):
	if node.name == "Player":
		finish_level()
		
func finish_level():
	GlobalLevelConst.game_root.scene_manager.load_salute()
