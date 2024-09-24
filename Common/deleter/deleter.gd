extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area is Falling_Object:
		area.get_parent().remove_child(area)
