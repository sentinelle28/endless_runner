extends CharacterBody2D

class_name Player
const JUMP_VELOCITY:int = 40000
var health:int = 3



func _process(delta: float) -> void:
	_move(delta)


func _move(delta:float)->void:
	var direction:float = Input.get_axis("ui_up","ui_down")
	velocity.y = direction * JUMP_VELOCITY * delta
	move_and_slide()

func _take_dmg(dmg:int)->void:
	health -= dmg
	if health <= 0:
		get_tree().paused = true
		DeathMenu._show_end()
		
