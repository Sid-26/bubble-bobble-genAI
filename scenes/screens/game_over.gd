extends Node2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
func _ready() -> void:
	anim.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		GameManager.reset_stats()
		
		get_tree().change_scene_to_file("res://scenes/main/main.tscn")
