extends Node

const startingHealth = 6
var maxHealth
var health
var boatSpeed
var items = {"coin": 0, "flowerpot": 0, "ribonukleoprotein": 0, "shoe": 0}
var shipPosition

func _ready():
	reset()

func reset(): 
	maxHealth = startingHealth
	health = maxHealth
	boatSpeed = 65
	items = {"coin": 0, "flowerpot": 0, "ribonukleoprotein": 0, "shoe": 0}
