extends Node


var score_value:int = 0
var score_mult:int = 1



func _add_score(value:int)->void:
	score_value += value*score_mult

func _reset_score()->void:
	score_mult = 1
	score_value = 0
	_start()

func _start()->void:
	$Timer.start(1)

func _add_time_score()->void:
	_add_score(10)
	$Timer.start(1)

func _stop()->void:
	$Timer.stop()
	
func get_score()->int:
	return score_value
	
func get_mult()->int:
	return score_mult
