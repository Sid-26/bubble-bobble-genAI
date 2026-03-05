extends Area2D

var can_be_collected := false

func _ready() -> void:
	var tween = create_tween()

	tween.tween_property(self, "position", position + Vector2(0, -20), 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", position, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	
	await get_tree().create_timer(0.4).timeout
	can_be_collected = true
	
	for body in get_overlapping_bodies():
		_on_body_entered(body)

func _on_body_entered(body: Node2D) -> void:
	if not can_be_collected:
		return
		
	if body.is_in_group("player"):
		if body.has_method("apply_speed_boost"):
			body.apply_speed_boost(1.5, 3.0)
		GameManager.add_score(50) 
		queue_free()
