extends CharacterBody2D


@export var Velocity = 0.0
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO
@export var jump = 0.0
var timer
const doubleTapDelay = 0.25
var doubleTapTime = doubleTapDelay
var lastKey = 0
var oldPosition = Vector2.ZERO
var canStop:bool
 
	 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = get_node("Timer") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2.ZERO 
	if Input.is_action_pressed("MoveR"):	
		direction.x += 1
	if Input.is_action_pressed("MoveL"):	
		direction.x -= 1
	
	position.x += direction.x * delta * Velocity * 100
	
	doubleTapTime -= delta
	

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity*delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -jump
		print(velocity.y)
	
		
		
	
	
	
	move_and_slide()
func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventKey and event.is_pressed():
		
		
		print(event.get_keycode_with_modifiers())
		if lastKey == event.get_keycode_with_modifiers() and doubleTapTime > 0:
			oldPosition = position
			print("Double")
			if lastKey == 68:
				velocity.x = 0.1 * Velocity *1000
				move_and_slide()
				print(position.x ," ", oldPosition.x)
				if position.x == oldPosition.x + 10: 
					velocity.x = 10000 * Velocity * 1000
	elif event is InputEventKey and event.is_released():
		lastKey = event.get_keycode_with_modifiers()
		doubleTapTime = doubleTapDelay
		velocity.x = 0 
		
