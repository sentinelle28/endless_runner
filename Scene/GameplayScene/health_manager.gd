extends Node

@export var player:Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for i in range(get_child_count()):
		if i < player.health:
			get_child(i).show()
		else:
			get_child(i).hide()
