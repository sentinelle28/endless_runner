extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Hi_score/hi_label.text = _convert(Score.get_highscore())
	$score/Score.text = _convert(Score.get_score())
	$mult/mult.text = str(Score.get_mult())

func _convert(value:int)->String:
	var s:String = ""
	for i in range(8-len(str(value))):
		s += "0"
	s += str(value)
	return s
	
