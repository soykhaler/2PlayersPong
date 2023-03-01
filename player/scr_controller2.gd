extends KinematicBody2D
var started : bool = false
export var speed : int = 10

func _input(event):
	if event.is_action_pressed("ui_accept"):
		started = true

func _ready():
	pass 
	
func _physics_process(delta):
	if started == true:
		if Input.is_action_pressed("ui_up"):
			var mov = Vector2(0, -speed)
			move_and_collide(mov)
		if Input.is_action_pressed("ui_down"):
			var mov = Vector2(0,speed)
			move_and_collide(mov)


#
#----------------------------INTELIGENCIA ARTIFICIAL-------------------------------
#
#
#func _physics_process(delta):
#	if started == true:
#		if Input.is_action_pressed("move_up"):
#			yield(get_tree().create_timer(0.3),"timeout")
#			var mov = Vector2(0, -speed)
#			move_and_collide(mov)
#		if Input.is_action_pressed("move_down"):
#			yield(get_tree().create_timer(0.3),"timeout")
#			var mov = Vector2(0, speed)
#			move_and_collide(mov)
		
