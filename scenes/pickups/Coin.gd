extends Node2D

func _ready():
	pass 


func _on_Coin_area_entered(area):
	if area.has_method("pick_up_loot"):
		var loot_name :String  = "coin"
		area.pick_up_loot(loot_name)
		queue_free()
