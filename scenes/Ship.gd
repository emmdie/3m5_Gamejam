extends Area2D

export var max_speed = 400
export var acceleration = 10
var screen_size
var velocity = Vector2.ZERO

func _ready():
	screen_size = get_viewport().size
	

func _process(delta):
	if abs(velocity.y) >=0.5:
		velocity.y *= 0.95
	else: 
		velocity.y = 0
	if abs(velocity.x) >=0.5:
		velocity.x *= 0.95
	else: 
		velocity.x = 0
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1*acceleration
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1*acceleration
	if Input.is_action_pressed("move_down"):
		velocity.y += 1*acceleration
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1*acceleration

	if velocity.length() > 0:
		if velocity.length() > max_speed:
			velocity = velocity.normalized() * max_speed
		$Sprite.set_rotation(velocity.angle()-PI/2)
		$Particles2D.set_rotation(-velocity.angle())
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
		$Particles2D.set_emitting(true)
	else:
		$Particles2D.set_emitting(false)
