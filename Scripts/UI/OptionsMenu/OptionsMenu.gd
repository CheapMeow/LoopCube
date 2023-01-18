extends VBoxContainer

var style : int = 0
var max_style : int = 3

onready var viewportContainer = GlobalLevelConst.game_root.get_parent().get_parent()

func _ready(): 
	$Music/Button.connect("button_down", self, "toggle_music")
	$FX/Button.connect("button_down", self, "toggle_fx")
	$Style/Button.connect("button_down", self, "changle_style")
	$Return/Button.connect("button_down", self, "close_options_menu")
	
	get_parent().get_parent().connect("visibility_changed", self, "update_menu")
	
	update_menu()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		close_options_menu()		
	
func update_menu():
	if not GlobalLevelConst.game_root:
		return
	
	$Music.item_name = 'MUSIC ON' if GlobalLevelConst.game_root.settings.music else 'MUSIC OFF'
	$FX.item_name = 'SOUND EFFECTS ON' if GlobalLevelConst.game_root.settings.fx else 'SOUND EFFECTS OFF'	
	
func toggle_music():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.settings.music = not GlobalLevelConst.game_root.settings.music
		update_menu()
	
func toggle_fx():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.settings.fx = not GlobalLevelConst.game_root.settings.fx
		update_menu()

func changle_style():
	style += 1
	if style >= max_style:
		style -= max_style
	
	if style == 0:
		viewportContainer.material = null
		$Style.item_name = "STYLE: RAW"
	if style == 1:
		viewportContainer.material = load("res://Materials/Sobel.tres")
		$Style.item_name = "STYLE: SOBEL"
	if style == 2:
		viewportContainer.material = load("res://Materials/FadedMovie.tres")
		$Style.item_name = "STYLE: FADEDMOVIE"
		
func close_options_menu():
	if GlobalLevelConst.game_root:
		GlobalLevelConst.game_root.get_node("UI").visible = true
		GlobalLevelConst.game_root.get_node("Options").visible = false
