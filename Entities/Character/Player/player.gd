extends CharacterBody2D

class_name Player
var coins:int = 0

const JUMP_VELOCITY:int = 40000
var health:int = 3


func _process(delta: float) -> void:
	_move(delta)


func _move(delta:float)->void:
	var direction:float = Input.get_axis("ui_up","ui_down")
	velocity.y = direction * JUMP_VELOCITY * delta
	move_and_slide()

func _take_dmg(dmg:int)->void:
	if $invicibility.time_left == 0:
		$invicibility.start(2.5)
		health -= dmg
		if health <= 0:
			get_tree().paused = true
			DeathMenu._show_end()
		

func _add_coins()->void:
	coins += 1
	if coins > 3:
		coins = 0
		Score.score_mult += 1
		Score._add_score(100)


func _on_timer_timeout() -> void:
	Score._add_score(10)
	$"../UI/Timer".start(3)
