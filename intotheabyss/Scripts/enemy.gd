extends CharacterBody2D

# Speed of movement
@export var speed: float = 100.0
# Distance to move back and forth
@export var move_distance: float = 30.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Internal variables
var start_position: Vector2
var direction: int = 1  # 1 means moving right, -1 means moving left

# Called once when the node enters the scene
func _ready():
	start_position = global_position  # Save the initial position

# Called every frame
func _process(_delta: float):
	# Calculate the target position based on direction and move_distance
	var target_position = start_position.x + direction * move_distance

	# Check if the character has reached the target position
	if (direction == 1 and global_position.x >= target_position) or (direction == -1 and global_position.x <= target_position):
		direction *= -1  # Reverse direction when reaching the limit
		
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("chomp")

	# Apply velocity to move back and forth
	velocity.x = direction * speed
	move_and_slide()
