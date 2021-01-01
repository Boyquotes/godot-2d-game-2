extends KinematicBody2D

var speed = 25
var maxSpeed = 250
var jumpForce = 500
var gravity = 900

var vel = Vector2()

onready var imagePlayer = get_node("player")

func _physics_process(delta):
	if abs(vel.x) < maxSpeed:
		if Input.is_action_pressed("player_left"):
			vel.x -= speed
			$player.play("run")
		elif Input.is_action_pressed("player_right"):
			vel.x += speed
			$player.play("run")
		else:
			$player.stop()
			
	vel.y += gravity * delta
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		vel.y -= jumpForce
		
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		imagePlayer.flip_h = true
		vel.x += 7
	if vel.x > 0:
		imagePlayer.flip_h = false
		vel.x -= 7
