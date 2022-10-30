extends MarginContainer

func _ready():
	get_tree().paused = true

func _on_Exit_pressed():
	get_tree().paused = false
	queue_free()
