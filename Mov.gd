extends CharacterBody2D

@export var Velocity = 0.0
const gravity = 10.0
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
	if Input.is_action_just_pressed("Jump"):
		direction.y = 1
	position.x += direction.x * delta * Velocity * 100
	
func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0,1)*gravity*delta)
	if direction.y == 1:
		position.y += -direction.y * jump * delta * 100
	
