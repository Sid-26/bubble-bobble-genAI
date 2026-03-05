extends Node2D

@export var enemy_scene: PackedScene
@export var max_enemies := 6
@export var spawn_rate: float = 2.0
@export var spawn_direction := 1

@onready var timer: Timer = $Timer
var enemies_spawned := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = spawn_rate
	
	if not timer.timeout.is_connected(_on_timer_timeout):
		timer.timeout.connect(_on_timer_timeout)
	
	print("enemy timer created")
	timer.start()

func _on_timer_timeout() -> void:
	if enemies_spawned < max_enemies:
		spawn_enemy()
	else:
		timer.stop()

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	print("spawning enemy")
	
	enemy.direction = spawn_direction
	get_parent().add_child(enemy)
	
	enemy.global_position = global_position
	
	enemies_spawned += 1
