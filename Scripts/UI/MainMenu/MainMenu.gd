extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready(): 
	# warning-ignore:return_value_discarded
	$Start/Button.connect("button_down", self, "start_game")
	# warning-ignore:return_value_discarded
	$Options/Button.connect("button_down", self, "open_options")
	# warning-ignore:return_value_discarded
	$Exit/Button.connect("button_down", self, "exit_game")
	
func start_game():
	print("start_game!!!")
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_choose_level()

func open_options():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_options()

func exit_game():
	get_tree().quit()
