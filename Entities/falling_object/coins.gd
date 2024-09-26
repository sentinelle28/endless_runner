extends Falling_Object
class_name Coins

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body._add_coins()
		get_parent().remove_child(self)
