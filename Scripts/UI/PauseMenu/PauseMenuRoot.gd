extends Control

# 本节点和 Options 的 Pause Mode 都为 Process 其他为 Inherit
func _process(delta):
	if Input.is_action_just_pressed("pause_menu"):
		get_tree().paused = not get_tree().paused
		$PauseMenu.visible = get_tree().paused
		pass

func _exit_tree():
	if get_tree().paused == true:
		get_tree().paused = false
