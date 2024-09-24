extends Node2D


@export var possible_points:Node2D
var possible_location:Array[Vector2] = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_points()


func _get_points()->void: #init
	for points:Node2D in possible_points.get_children():
		possible_location.append(points.global_position)


func _on_timer_timeout() -> void:
	$Timer.start(_get_cooldown())
	

func _get_cooldown()->float:
	return Speed.cooldown

func _spawn(path_to_object:String)->void:
	var object = load(path_to_object).instantiate()
	var pos :Vector2= possible_location.pick_random()
	_move(_get_pos(pos),_get_cooldown())
	
	await get_tree().create_timer(_get_cooldown()).timeout # to change
	
	
	object.global_position = pos
	add_child(object)

func _act()->void:
	_spawn("")
	
func _idle()->void:
	var pos:Vector2 = Vector2(global_position.x,possible_location.pick_random().y)
	_move(pos,1)
	
func _move(pos:Vector2,time:float)->void:
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(self,"global_position",pos,time)

func _get_pos(pos:Vector2)->Vector2:
	return Vector2(global_position.x,pos.y)
