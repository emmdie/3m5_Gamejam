extends Area2D


func _ready():
	pass 


func _on_Area2D_area_entered(area):
	if area.has_method("collision"):
		area.collision()
