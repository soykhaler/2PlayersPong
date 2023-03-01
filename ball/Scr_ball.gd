extends RigidBody2D

var started: bool = false
var respawn : bool = false
onready var pong_sound : AudioStreamPlayer = get_node("pong_sound")
var scene = load("res://ball/obj_ball.tscn")
var ball = scene.instance()
var player1 : int = 0
var player2 : int = 0
onready var Player1 = get_parent().get_node("Player1")
onready var Player2 = get_parent().get_node("Player2")
var getpoint : bool = false
var direction = RandomNumberGenerator.new()
func _input(event):
	if event.is_action_pressed("ui_accept"):
		if started == false:
			gravity_scale = 0
			direction.randomize()
			var direction_random = direction.randi_range(0,1)
			if direction_random == 0:
				linear_velocity = Vector2(750,50)
				started = true
			if direction_random == 1:
				linear_velocity = Vector2(-750,-50)
				started = true
func _ready():
	position = Vector2(512, 288)
	gravity_scale = 0
	linear_velocity = Vector2(0,0)
	pass 
func reset():
	rotation_degrees = 0
	Player1.text = str(player1)
	Player2.text = str(player2)
	getpoint = false
	started = false
	position = Vector2(512, 288)
	gravity_scale = 0
	linear_velocity = Vector2(0,0)
#	get_tree().change_scene("res://levels/level.tscn")
	pass
func _physics_process(delta):
	if started == true:
		rotation_degrees += 1
	for body in get_colliding_bodies():
		if body.get_name() == "KinematicBody2D":
			pong_sound.play() 
		if body.get_name() == "KinematicBody2D2":
			pong_sound.play()
			rotation_degrees -= 3
		if body.get_name() == "wall_player1":
			if getpoint == false:
				getpoint = true
				yield(get_tree().create_timer(0.3),"timeout")
				player1 += 1
				reset()
		elif body.get_name() == "wall_player2":
			if getpoint == false:
				getpoint = true
				yield(get_tree().create_timer(0.3),"timeout")
				player2 += 1
				reset()
		if body.get_name() == "collisionwall1":
			pong_sound.play()
		if body.get_name() == "collisionwall2":
			pong_sound.play()
			pass
