extends CharacterBody2D

#movement exports
@export var speed: float = 200
@export var accel: float = 4
@export var fricf: float = 0.2
@export var rot:Vector2
@export var controller:bool = false
@export var friction = 0.1
@export var acceleration = 0.1

#shooting exports
@export var firerate:float = 0.1
@export var cd_lvl:float = 1
@export var spreadshot:int = 1
@export var autofire:bool = false
@export var select:bool = true



func _physics_process(delta):

	movement()

func movement():
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()




func get_input():
	var input = Vector2()
	if Input.is_action_pressed('ui_right'):
		input.x += 1
	if Input.is_action_pressed('ui_left'):
		input.x -= 1
	if Input.is_action_pressed('ui_down'):
		input.y += 1
	if Input.is_action_pressed('ui_up'):
		input.y -= 1
	return input

	
# OLD MOVEMENT, FOR REFERENCE ONLY
#	var speed:float = 50
#	var max:int = 200
#	
#	velocity = velocity.normalized() * 100
#	
#	speed = clampf(speed, 0, 10)
#	velocity.x = clampf(velocity.x, -1 * max, max)
#	velocity.y = clampf(velocity.y, -1 * max, max)
#	
#	print(velocity.length())
#	
#	if Input.is_action_pressed("ui_left"):
#		velocity.x += speed * -1
#		print("leftyeah")
#		
#	if Input.is_action_pressed("ui_right"):
#		velocity.x +=  speed
#		
#	if Input.is_action_pressed("ui_up"):
#		velocity.y += speed * -1
#		
#	if Input.is_action_pressed("ui_down"):
#		velocity.y +=  speed
