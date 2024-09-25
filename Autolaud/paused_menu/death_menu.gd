extends Control

func _show_end()->void:
	show()
	$Panel/VBoxContainer/Score_p.text = str(Score.get_score())
	$Panel/VBoxContainer/Score_p2.text = str(Score.get_highscore())
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		Score._reset_score()
		if get_tree().paused ==true:
			get_tree().paused = false
		get_tree().reload_current_scene()
