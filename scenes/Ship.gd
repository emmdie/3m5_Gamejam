extends Area2D

signal hit_by_canon
signal pick_up_loot

onready var max_speed = GlobalVariables.boatSpeed
onready var damage_sound = $DamageSound
onready var pickup_sound = $PickupSound
onready var  coin_sound = $CoinSound
export var acceleration = 5
var screen_size
var velocity = Vector2.ZERO

func hit(arg_damage):
	damage_sound.play()
	if GlobalVariables.health > 0:
		GlobalVariables.health -= arg_damage
	else:
		get_tree().change_scene("res://scenes/menu/GameOverScreen.tscn")

func pick_up_loot(loot_name):
	if(loot_name == "coin"):
		coin_sound.play()
	else:
		pickup_sound.play()
	
	GlobalVariables.items[loot_name]+=1

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

func get_new_position(arg_position, arg_velocity, arg_delta):
	position += arg_velocity * arg_delta
	return position

func normalize_velocity_if_neccesary(arg_velocity):
	if arg_velocity.length() > max_speed:
			return arg_velocity.normalized() * max_speed
	else: 
		return arg_velocity
func movement():
	$AnimatedSprite.play()
	$Particles2D.set_emitting(true)

func no_movement():
	$Particles2D.set_emitting(false)
	$AnimatedSprite.stop()
	
func set_animation(arg_velocity):
	$AnimatedSprite.flip_v = velocity.x < 0
	if abs(velocity.x) < abs(velocity.y):
		$AnimatedSprite.animation = "Non_Horizontal"
	else:
		$AnimatedSprite.animation = "Horizontal"
		
func set_rotation(arg_velocity):
	var velocity_angle = arg_velocity.angle()
	$AnimatedSprite.set_rotation(velocity_angle)
	$Particles2D.set_rotation(-velocity_angle)

func collision():
	velocity = -1 * velocity
	
func _process(delta):
	var new_input = get_new_input(Input, velocity)
	if new_input.input_bool:
		velocity = new_input.velocity
	else:
		velocity = slowdown(velocity)
	if velocity.length() > 0:
		velocity = normalize_velocity_if_neccesary(velocity)
		set_rotation(velocity)
		movement()
		set_animation(velocity)
		position = get_new_position(position, velocity, delta)
	else:
		no_movement()
	GlobalVariables.shipPosition = global_position
