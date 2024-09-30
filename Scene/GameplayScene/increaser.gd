extends Timer


func _on_timeout() -> void:
	Speed.speed_value *= 1.1
	Speed.cooldown *= 0.9
	start(10)
