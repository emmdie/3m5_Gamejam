extends Node

var maxHealth
var health
var boatSpeed
var items = {"coin": 0, "flowerpot": 0, "ribonukleoprotein": 0, "shoe": 0}

func _ready():
	pass # Replace with function body.

func reset(): 
	maxHealth = 6
	health = maxHealth
	boatSpeed = 200
	
