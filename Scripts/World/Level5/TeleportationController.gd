extends Node2D

var player
var areas : Array

var isTeleporting : bool
var area_center : Vector2
var cur_area_index : int

var centerX = 975

func _ready():
	areas.append(get_node("LeftArea2D"))
	areas.append(get_node("RightArea2D"))
	areas[0].connect("body_entered", self, "beginTeleportation")
	areas[1].connect("body_entered", self, "beginTeleportation")
	areas[0].connect("body_exited", self, "endTeleportation")
	areas[1].connect("body_exited", self, "endTeleportation")

func _process(delta):
	if isTeleporting:
		print("Teleport!")
		if player.global_position.x < areas[0].global_position.x:
			player.global_position.x += areas[1].global_position.x - areas[0].global_position.x
		if areas[1].global_position.x < player.global_position.x:
			player.global_position.x += areas[0].global_position.x - areas[1].global_position.x
		
func beginTeleportation(node):
	if node.name == "Player":
		print("found player!")
		isTeleporting = true
		player = node

func endTeleportation(node):
	if node.name == "Player":
		print("lose player!")
		isTeleporting = false
