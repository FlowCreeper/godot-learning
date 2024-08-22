extends CharacterBody2D

@export var Velocity = 0.0
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO
@export var jump = 0.0
	 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2.ZERO 
	if Input.is_action_pressed("MoveR"):	
		direction.x += 1
	if Input.is_action_pressed("MoveL"):	
		direction.x -= 1
	
	position.x += direction.x * delta * Velocity * 100

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity*delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -jump
		print(velocity.y)
	
	move_and_slide()
	
