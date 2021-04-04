extends KinematicBody2D

var helpers = load("res://scripts/Helpers.gd").new()

export (float) var speed = 1
var movement_direction = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func change_direction():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var dir_choice = rng.randf_range(1, 100)
	
	if(dir_choice < 25):
		movement_direction = Vector2(0, 1)
	elif(dir_choice < 50):
		movement_direction = Vector2(1, 0)
	elif(dir_choice < 75):
		movement_direction = Vector2(-1, 0)
	else:
		movement_direction = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	change_direction()
	

func _process(delta):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var dir_choice = rng.randf_range(1,100)
	
	if(dir_choice > 99):
		change_direction()
		
	var collision = move_and_collide(movement_direction * speed)
	
	if(collision):
		change_direction()
		
	look_at(helpers.get_facing(position, movement_direction))
