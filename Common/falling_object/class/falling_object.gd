extends Area2D

class_name Falling_Object
@export var speed:int = 1000

func _ready() -> void:
	speed = Speed.speed_value


func _process(delta: float) -> void:
	global_position.y -= speed * delta
