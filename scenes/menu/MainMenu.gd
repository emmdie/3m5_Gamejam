extends BoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_PlayButton_pressed():
	GlobalVariables.reset()
	get_tree().change_scene("res://scenes/Level.tscn")


func _on_AboutButton_pressed():
	OS.shell_open("https://github.com/emmdie/3m5_Gamejam/blob/main/README.md")


func _on_QuitButton_pressed():
	get_tree().quit()
