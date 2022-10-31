extends BoxContainer

onready var PAUSE = preload("res://scenes/menu/OptionScreen.tscn")

func _on_PlayButton_pressed():
	GlobalVariables.reset()
	get_tree().change_scene("res://scenes/Level.tscn")

func _on_AboutButton_pressed():
	OS.shell_open("https://github.com/emmdie/3m5_Gamejam/blob/main/README.md")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_OptionsButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
