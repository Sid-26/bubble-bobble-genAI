extends CharacterBody2D

enum State {IDLE, RUN, JUMP, FIRE}

var current_state: State = State.IDLE

@export var speed := 300.0
@export var speed_multiplier := 1.0
@export var jump_velocity := -400.0 * 1.5
@export var gravity := 1000.0
@export var bubble_scene: PackedScene

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var iframe_timer: Timer = $HitTimer
@onready var speed_timer: Timer = $SpeedTimer
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var run_sound: AudioStreamPlayer2D = $RunSound


var facing := 1
var is_invincible := false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	match current_state:
		State.FIRE:
			velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
		
		_:
			handle_movement()
			if Input.is_action_just_pressed("fire"):
				fire_bubble()

	move_and_slide()
	update_animations()
	handle_iframes_visuals()

func handle_movement() -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity
		jump_sound.play()
	
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		velocity.x = direction * speed * speed_multiplier
		facing = sign(direction)
		current_state = State.RUN if is_on_floor() else State.JUMP 
		
		if is_on_floor() and not run_sound.playing:
			run_sound.play()
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)
		if is_on_floor():
			current_state = State.IDLE
		else:
			current_state = State.JUMP
	if current_state != State.RUN:
		run_sound.stop()

func fire_bubble() -> void:
	current_state = State.FIRE
	var bubble = bubble_scene.instantiate()
	var offset = Vector2(10, 0)
	offset.x *= facing
	
	bubble.global_position = global_position + offset
	bubble.dir = facing
	#print("player:", global_position)
	#print("bubble:", bubble.global_position)
	
	get_parent().add_child(bubble)

func update_animations() -> void:
	anim.flip_h = (facing < 0)
	#var dir_str: String = "right" if facing == 1 else "left"
	
	if current_state == State.FIRE:
		anim.flip_h = (facing > 0) 
	else:
		anim.flip_h = (facing < 0)
	
	match current_state:
		State.IDLE:
			anim.play("idle")
		State.RUN:
			anim.play("run")
		State.JUMP:
			anim.play("jump")
		State.FIRE:
			anim.play("fire")
			
func _on_animated_sprite_2d_animation_finished() -> void:
	if current_state == State.FIRE:
		current_state = State.IDLE

func handle_iframes_visuals() -> void:
	if is_invincible:
		anim.visible = Engine.get_frames_drawn() % 10 < 5
	else:
		anim.visible = true

func _on_hit_box_body_entered(body: Node2D) -> void:
	print("HitBox touched by: ", body.name) 
	print("Is it in the group? ", body.is_in_group("enemies"))
	
	if body.is_in_group("enemies"):
		take_damage()

func take_damage() -> void:
	if is_invincible:
		return
		
	GameManager.lose_life()
	
	if GameManager.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/screens/GameOver.tscn")
	
	is_invincible = true
	iframe_timer.start()

func apply_speed_boost(multiplier: float, duration: float) -> void:
	speed_multiplier = multiplier
	speed_timer.wait_time = duration
	speed_timer.start() 

	print("SPEED BOOST ACTIVATED!")
	
func _on_hit_timer_timeout() -> void:
	is_invincible = false
	anim.visible = true


func _on_speed_timer_timeout() -> void:
	speed_multiplier = 1.0
	print("Speed boost ended.")
