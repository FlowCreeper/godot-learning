extends CharacterBody2D

@export var Velocity = 0.0  
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("MoveR"):	
		direction.x += 1
	if Input.is_action_pressed("MoveL"):	
		direction.x -= 1
	position += direction * delta * Velocity * 100
	print(position)
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0,1))
