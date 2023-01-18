extends Label

var guidance_time : float = 5.0

func _process(delta):
	guidance_time -= delta
	if guidance_time < 0.0:
		delete_guidance()
		
	set("custom_colors/font_color", Color(1,1,1,guidance_time/5.0))
	
func delete_guidance():
	queue_free()
