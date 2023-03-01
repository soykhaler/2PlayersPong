extends Label


	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		hide()
		

func _ready():
	show()
	pass 
	
