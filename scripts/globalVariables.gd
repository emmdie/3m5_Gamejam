extends Node

const startingHealth = 6
var maxHealth
var health
var boatSpeed
var items = {"coin": 0, "flowerpot": 0, "ribonukleoprotein": 0, "shoe": 0}

func _ready():
	reset()

func reset(): 
	maxHealth = startingHealth
	health = maxHealth
	boatSpeed = 100
	items = {"coin": 0, "flowerpot": 0, "ribonukleoprotein": 0, "shoe": 0}
	
