extends KinematicBody2D

export (int) var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta: float) -> void:
	var movement_direction = Vector2.ZERO;
	if(Input.is_action_pressed('up')):
		movement_direction.y = -1
	if(Input.is_action_pressed('down')):
		movement_direction.y = 1
	if(Input.is_action_pressed('left')):
		movement_direction.x = -1
	if(Input.is_action_pressed('right')):
		movement_direction.x = 1
		movement_direction.y = 0

	movement_direction = movement_direction.normalized()
	
	move_and_slide(movement_direction * speed)
	
	look_at(get_global_mouse_position())
	