extends Area2D

export var max_speed = 200
export var acceleration = 10
var screen_size
var velocity = Vector2.ZERO

func _ready():
	screen_size = get_viewport().size

func slowdown(velocity):
	if abs(velocity.y) >=0.5:
		velocity.y *= 0.90
	else: 
		velocity.y = 0
	if abs(velocity.x) >=0.5:
		velocity.x *= 0.90
	else: 
		velocity.x = 0
	return velocity

func get_new_input(input, velocity):
	var input_bool = false
	if Input.is_action_pressed("move_right"):
		velocity.x += 1*acceleration
		input_bool = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1*acceleration
		input_bool = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1*acceleration
		input_bool = true
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1*acceleration
		input_bool = true
	return {"input_bool":input_bool, "velocity":velocity}	

func _process(delta):
	var new_input = get_new_input(Input, velocity)
	if new_input.input_bool:
		velocity = new_input.velocity
	else:
		velocity = slowdown(velocity)
	if velocity.length() > 0:
		if velocity.length() > max_speed:
			velocity = velocity.normalized() * max_speed
		$AnimatedSprite.play()
		$Particles2D.set_emitting(true)
		if new_input.input_bool:
			if abs(velocity.x) < 10 and abs(velocity.y) !=0 :
				$AnimatedSprite.animation = "Non_Horizontal"
			else:
				$AnimatedSprite.animation = "Horizontal"
			
			$AnimatedSprite.set_rotation(velocity.angle()-PI)
			$Particles2D.set_rotation(-velocity.angle())
			$AnimatedSprite.flip_v = velocity.x < 0
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		
	else:
		$Particles2D.set_emitting(false)
		$AnimatedSprite.stop()
