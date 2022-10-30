extends HBoxContainer

onready var pauseScene = preload("res://scenes/menu/OptionScreen.tscn")

func _ready():
	pass
	
func _process(delta):
	$Amount_Coins.text = str(GlobalVariables.items["coin"])
	$Amount_Shoes.text = str(GlobalVariables.items["shoe"])
	$Amount_Flowerpots.text = str(GlobalVariables.items["flowerpot"])
	$Amount_Ribonukleoproteins.text = str(GlobalVariables.items["ribonukleoprotein"])
	$Amount_Health.text = str(GlobalVariables.health)
	if Input.is_action_pressed("ui_cancel"):
		add_child(pauseScene.instance())
