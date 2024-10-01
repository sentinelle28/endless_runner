extends CharacterBody2D

class_name Falling_Object
@export var speed:int = 10

func _ready() -> void:
	speed = Speed.speed_value


func _process(delta: float) -> void:
	velocity.x = -(speed * delta)
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body._take_dmg(1)
		_death()

func _death()->void:
	get_parent().call_deferred("remove_child",self)


func _on_point_body_exited(body: Node2D) -> void:
	if body is Player:
		Score._add_score(100)
