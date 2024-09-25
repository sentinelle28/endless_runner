extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body is Falling_Object:
		body.get_parent().remove_child(body)
