extends Area2D

export(int) var damage = 1
export(int) var speed = 15
var max_delta = 1.5
var current_delta = 0

func is_outside_view_bounds():
	return position.x>OS.get_screen_size().x or position.x<0.0\
		or position.y>OS.get_screen_size().y or position.y<0.0

func _process(delta):
	current_delta += delta
	print(current_delta)
	if is_outside_view_bounds():
		queue_free()
	var velocity = ($Position2D2.global_position -  $Position2D.global_position) * delta * speed
	global_position = global_position + velocity
	if current_delta > max_delta:
		queue_free()


func _on_Canonball_area_entered(area):
	if area.has_method("hit"):
		area.hit(damage)
		queue_free()
