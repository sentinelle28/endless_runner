extends CharacterBody2D

class_name Player
@export var bullet_ref:PackedScene
@export var bullet_stocker:Node
var coins:int = 0

const JUMP_VELOCITY:int = 40000
var health:int = 3


func _process(delta: float) -> void:
	_move(delta)
	_shoot()
	_accelerate()

func _move(delta:float)->void:
	var direction:float = Input.get_axis("ui_up","ui_down")
	velocity.y = direction * JUMP_VELOCITY * delta
	move_and_slide()

func _take_dmg(dmg:int)->void:
	if $invicibility.time_left == 0:
		$AnimationPlayer.play("hurt")
		$invicibility.start(2.5)
		$AnimationPlayer.animation_set_next("hurt","invicibility")
		$hit.play()
		health -= dmg
		if health <= 0:
			get_tree().paused = true
			DeathMenu._show_end()
		

func _add_coins()->void:
	$pickup.play()
	coins += 1
	if coins == 3:
		$mult_up.play()
		Score.score_mult += 1
		Score._add_score(100)
		_reset_coin()


func _on_timer_timeout() -> void:
	Score._add_score(10)
	$"../UI/Timer".start(3)

func _shoot()->void:
	if coins > 0 and Input.is_action_just_pressed("shoot"):
		var bullet:CharacterBody2D = bullet_ref.instantiate()
		bullet_stocker.add_child(bullet)
		bullet.global_position = global_position + Vector2(10,0)
		coins -= 1
		$shoot.play()

func _reset_coin()->void:
	coins = 0

func _accelerate()->void:
	if Input.is_action_just_pressed("ui_right"):
		Score._add_mult(1)
		Speed.speed_value += 600
	elif Input.is_action_just_released("ui_right"):
		Score._add_mult(-1)
		Speed.speed_value -= 600
