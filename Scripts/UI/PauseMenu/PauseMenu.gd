extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready(): 
	# warning-ignore:return_value_discarded
	$Return/Button.connect("button_down", self, "return_main_menu")
	# warning-ignore:return_value_discarded
	$Restart/Button.connect("button_down", self, "restart")
	# warning-ignore:return_value_discarded
	$Options/Button.connect("button_down", self, "open_options")
	# warning-ignore:return_value_discarded
	$Exit/Button.connect("button_down", self, "exit_game")
	
func return_main_menu():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_main_menu()

func restart():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_level(GlobalLevelConst.game_root.last_level_index)
	
func open_options():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_options()

func exit_game():
	get_tree().quit()
