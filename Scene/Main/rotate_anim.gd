extends Node2D

@export var radius:int = 10
@export var dec:float = 0.1
var previous:float = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$orb.global_position = global_position + Vector2(cos(previous),sin(previous))*radius
	$player.global_position = global_position + Vector2(cos(previous-dec),sin(previous-dec))*radius
	previous += delta
