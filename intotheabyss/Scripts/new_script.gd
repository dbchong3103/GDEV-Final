extends CharacterBody2D

var follow_speed = 100
var min_follow_distance = 10
var gravity = 1000

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var knight: CharacterBody2D = $"../Knight"

func _physics_process(delta):
	# Calculate the direction to the target
	var direction = (knight.global_position - global_position).normalized()
	
	# Apply gravity
	velocity.y += gravity * delta
	
	# Move towards the target if the distance is greater than the minimum
	if global_position.distance_to(knight.global_position) > min_follow_distance:
		velocity.x = direction.x * follow_speed
		move_and_slide()
	else:
		velocity.x = 0
	
	# Reset the y velocity if the character is on the floor
	if is_on_floor():
		velocity.y = 0
