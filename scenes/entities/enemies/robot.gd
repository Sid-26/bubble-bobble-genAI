extends CharacterBody2D

@export var speed := 100.0
@export var gravity := 1000.0
@export var direction := 1

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_and_slide()
	
	if is_on_wall():
		direction *= -1
	
	anim.flip_h = (direction < 0)
	
	if not is_on_floor():
		anim.play("fall")
	else:
		anim.play("move")
