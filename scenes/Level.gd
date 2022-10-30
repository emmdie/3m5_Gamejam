extends Node2D

onready var pauseScene = preload("res://scenes/menu/OptionScreen.tscn")

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		add_child(pauseScene.instance())
	
