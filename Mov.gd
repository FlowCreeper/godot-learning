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
var dashTime = 1
@export var airDashCount = 0
 
	 
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
	if is_on_floor():
		airDashCount = 0
	position.x += direction.x * delta * Velocity * 100
	
	doubleTapTime -= delta
	dashTime -=delta
	

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
			
			print(lastKey)
			print("Double")
			match  lastKey:
				68 when is_on_floor():
					velocity.x = 2 * Velocity *1000
					move_and_slide()
					if dashTime > 0:
						velocity.x = 0.1 * Velocity * 1000
				68 when !is_on_floor():
					if  airDashCount<1:
						velocity.x = 2 * Velocity *1000
						move_and_slide()
						velocity.x = 0
						airDashCount += 1
						print(airDashCount)
				65  when is_on_floor():
					velocity.x = -2 * Velocity *1000
					move_and_slide()
					if dashTime > 0:
						velocity.x = -0.1 * Velocity * 1000
				65 when !is_on_floor():
					if  airDashCount<1:
						velocity.x = -2 * Velocity *1000
						move_and_slide()
						velocity.x = 0
						airDashCount += 1
			
		
	elif event is InputEventKey and event.is_released():
		
		dashTime = 1
		velocity.x = 0 
	if event is InputEventKey:
		if event.is_action_pressed("MoveR") or event.is_action_pressed("MoveL"):
			lastKey = event.get_keycode_with_modifiers()
			doubleTapTime = doubleTapDelay
	if event is InputEventJoypadButton and event.is_pressed():
		if event is InputEventJoypadButton and event.is_pressed():
			print(event.button_index)
		
			
		if lastKey == event.button_index and doubleTapTime > 0:
			
			print(lastKey)
			print("Double")
			match  event.button_index:
				14 when is_on_floor():
					velocity.x = 2 * Velocity *1000
					move_and_slide()
					if dashTime > 0:
						velocity.x = 0.1 * Velocity * 1000
				14 when !is_on_floor():
					if  airDashCount<1:
						velocity.x = 2 * Velocity *1000
						move_and_slide()
						velocity.x = 0
						airDashCount += 1
						print(airDashCount)
				13  when is_on_floor():
					velocity.x = -2 * Velocity *1000
					move_and_slide()
					if dashTime > 0:
						velocity.x = -0.1 * Velocity * 1000
				13 when !is_on_floor():
					if  airDashCount<1:
						velocity.x = -2 * Velocity *1000
						move_and_slide()
						velocity.x = 0
						airDashCount += 1
			
		
	elif event is InputEventJoypadButton and event.is_released():
		
		dashTime = 1
		velocity.x = 0 
	if event is InputEventKey:
		if event.is_action_pressed("MoveR") or event.is_action_pressed("MoveL"):
			lastKey = event.get_keycode_with_modifiers()
			doubleTapTime = doubleTapDelay
	if event is InputEventJoypadButton:
		if event.is_action_pressed("MoveR") or event.is_action_pressed("MoveL"):
			lastKey = event.button_index
			doubleTapTime = doubleTapDelay
