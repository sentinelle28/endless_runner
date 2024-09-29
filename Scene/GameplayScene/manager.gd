extends Node

@export var player:Player
@export var anim:AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if player.coins == 3:
		anim.play("blink")
		await anim.animation_finished
		player.coins = 0
		Score.score_mult += 1
		Score._add_score(100)
		
		
	for i in range(get_child_count()):
		if i < player.coins:
			get_child(i).show()
		else:
			get_child(i).hide()
