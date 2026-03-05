extends Area2D

enum State { MOVING, TRAPPED, POPPED }
var current_state: State = State.MOVING

@export var fruit_scene: PackedScene
@export var horizontal_speed := 250.0
@export var float_speed := 50.0
@export var travel_time := 1.0
@export var life_time := 3.0

var dir := 1
var float_up := false
var time_alive := 0.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var despawn_timer: Timer = $DespawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("blow")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		State.MOVING:
			time_alive += delta
			
			if time_alive >= travel_time and not float_up:
				float_up = true
				despawn_timer.start()
				
			if not float_up:
				position.x += dir * horizontal_speed * delta
			else:
				position.y -= float_speed * delta
				
		State.TRAPPED:
			anim.play("trapped")
			position.y -= float_speed * delta
		
		State.POPPED:
			anim.play("pop")

func _on_despawn_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies") and current_state != State.TRAPPED:
		body.queue_free()
		current_state = State.TRAPPED
	elif body.is_in_group("player") and current_state == State.TRAPPED:
		GameManager.add_score(100)
		current_state = State.POPPED
		
		if fruit_scene and randf() > 0.5:
			var fruit = fruit_scene.instantiate()
			fruit.global_position = global_position
			get_parent().call_deferred("add_child", fruit)
		
		await anim.animation_finished
		queue_free()
