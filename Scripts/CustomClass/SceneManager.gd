extends Node2D

class_name SceneManager

const _containers = ['UI', 'World']
var _root: Node2D

func _init(root: Node2D):
	_root = root
	
# 如果要加载一组场景 level，那么需要在 res://Scene/UI 和 res://Secen/World 中都存在 level.tscn
# World 节点在 UI 节点的顶部，在顶部的节点最后渲染，这样保证了 UI 不被 World 遮挡
func _load_scene(name: String):
	var file_checker = File.new()
	for container in _containers:
		# 删掉旧场景的 UI 和 World 节点的子节点
		var node := _root.get_node(container)
		_remove_children(node)
		# 添加新场景的 UI 和 World 节点
		# 如果是 Level，那么对于 UI 加载 PauseMenu；其他场景不变
		var scene : String
		if container == "UI" and name.begins_with("Level"):
			scene = 'res://Scenes/' + container + '/' + "PauseMenu" + '.tscn'
		else:
			scene = 'res://Scenes/' + container + '/' + name + '.tscn'
		# 如果加载成功，那么就取代旧节点 
		if file_checker.file_exists(scene):
			node.replace_by(load(scene).instance())
		else:
			print(scene + ' does not exists')

func _remove_children(node: Node):
	for child in node.get_children():
		child.queue_free()

func load_main_menu():
	_load_scene("MainMenu")
		
func load_options():
	_root.get_node("UI").visible = false
	_root.get_node("Options").visible = true
	
func load_choose_level():
	_load_scene("ChooseLevel")
	
func load_level(index : int):
	_root.last_level_index = index
	_load_scene("Level" + str(index))

func load_salute():
	_load_scene("Salute")
