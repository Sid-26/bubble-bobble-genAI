extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		get_tree().change_scene_to_file("res://scenes/main/main.tscn")
