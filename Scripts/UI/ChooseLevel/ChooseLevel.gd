extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready(): 
	for i in range(GlobalLevelConst.level_count):
		get_node("Level"+str(i+1)+"/Button").connect("button_down", self, "start_level", [i+1])
	$Return/Button.connect("button_down", self, "return_to_main_menu")
	
func start_level(index):
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_level(index)

func return_to_main_menu():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.scene_manager.load_main_menu()
