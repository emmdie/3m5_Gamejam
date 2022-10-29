extends Area2D

export var speed = 100 
var screen_size

func _ready():
	screen_size = get_viewport().size


func _process(delta):
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		set_rotation(velocity)
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)

func set_rotation(velocity):
	if velocity.y<0 and velocity.x == 0:
		$Sprite.set_rotation_degrees(0)
	elif velocity.y<0 and velocity.x > 0:
		$Sprite.set_rotation_degrees(45)
	elif velocity.y<0 and velocity.x < 0:
			$Sprite.set_rotation_degrees(-45)
	elif velocity.y>0 and velocity.x == 0:
		$Sprite.set_rotation_degrees(180)
	elif velocity.y>0 and velocity.x > 0:
		$Sprite.set_rotation_degrees(135)
	elif velocity.y>0 and velocity.x < 0:
		$Sprite.set_rotation_degrees(-135)
	elif velocity.y==0 and velocity.x == 0:
		$Sprite.set_rotation_degrees(0)
	elif velocity.y==0 and velocity.x > 0:
		$Sprite.set_rotation_degrees(90)
	elif velocity.y==0 and velocity.x < 0:
		$Sprite.set_rotation_degrees(-90)
