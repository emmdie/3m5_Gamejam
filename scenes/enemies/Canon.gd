extends Node2D

onready var base = $Base
onready var barrel = $Barrel
onready var muzzle  = $Barrel/Muzzle
onready var CANONBALL = preload("res://scenes/enemies/Canonball.tscn")

export var reloadTime = 2

func fire():
	while true:
		var canonballInstance = CANONBALL.instance()
		canonballInstance.global_position = muzzle.global_position
		canonballInstance.global_rotation = muzzle.global_rotation
		get_node('/root').add_child(canonballInstance)
		add_child(canonballInstance)
		# play audio
		$AudioStreamPlayer2D.play()
		var t = Timer.new()
		var r = rand_range(0, 2)
		t.set_wait_time(2 + r)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		t.queue_free()

func turn():
	get_node("Barrel").look_at(GlobalVariables.shipPosition)
	
func _process(delta):
	turn()

func _ready():
	fire()
