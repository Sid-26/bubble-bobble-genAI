extends Node

signal score_changed(new_score: int)
signal lives_changed(new_lives: int)

var score: int = 0
var lives: int = 3

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)

func lose_life() -> void:
	lives -= 1
	lives_changed.emit(lives)

func reset_stats() -> void:
	score = 0
	lives = 3
	score_changed.emit(score)
	lives_changed.emit(lives)
