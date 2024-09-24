extends CharacterBody2D

class_name Player
const JUMP_VELOCITY:int = 40000


func _process(delta: float) -> void:
	_move(delta)


func _move(delta:float)->void:
	var direction:float = Input.get_axis("ui_up","ui_down")
	velocity.y = direction * JUMP_VELOCITY * delta
	move_and_slide()
