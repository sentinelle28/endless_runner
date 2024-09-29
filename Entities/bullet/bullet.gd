extends CharacterBody2D


var speed:int = 4000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = delta * Vector2(1,0) * speed
	move_and_slide()
	if global_position.x > 2000:
		get_parent().call_deferred("remove_child",self)
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Falling_Object:
		Explosion.play()
		area.get_parent()._death()
		get_parent().call_deferred("remove_child",self)
