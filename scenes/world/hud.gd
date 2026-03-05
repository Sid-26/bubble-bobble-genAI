extends CanvasLayer

@onready var score_label: Label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var lives_label: Label = $MarginContainer/HBoxContainer/LivesLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.score_changed.connect(update_score)
	GameManager.lives_changed.connect(update_lives)
	
	update_score(GameManager.score)	
	update_lives(GameManager.lives)

func update_score(new_score: int) -> void:
	score_label.text = "SCORE: " + str(new_score)

func update_lives(new_lives: int) -> void:
	lives_label.text = "LIVES LEFT: " + str(new_lives)
