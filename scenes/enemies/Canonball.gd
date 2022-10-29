extends Area2D

export(int) var speed = 30

func is_outside_view_bounds():
	return position.x>OS.get_screen_size().x or position.x<0.0\
		or position.y>OS.get_screen_size().y or position.y<0.0

func _process(delta):
	if is_outside_view_bounds():
		queue_free()
	var velocity = ($Position2D2.global_position -  $Position2D.global_position) * delta * speed
	global_position = global_position + velocity

func _on_Canonball_body_entered(body):
	if body.get_collision_layer_bit(2):
		body.hit_by_Canonball(body.position)
	queue_free()
