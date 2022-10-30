extends CanvasLayer

func _ready():
	get_tree().paused = true

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Exit_pressed():
	get_tree().paused = false
	queue_free()
