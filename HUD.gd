extends HBoxContainer




func _ready():
	$Amount_Coins.text = str(0)
	
func _process(delta):
	$Amount_Coins.text = str(GlobalVariables.items["coin"])
