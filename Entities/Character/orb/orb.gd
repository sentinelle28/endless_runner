extends Node2D


@export var possible_points:Node2D
@export var bullet_stocker:Node
var possible_location:Array[float] = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_points()
	$Timer.start(get_cooldown())

func _get_points()->void: #init
	for points:Node2D in possible_points.get_children():
		possible_location.append(points.global_position.y)


func _on_timer_timeout() -> void:
	$Timer.start(get_cooldown())
	_act()
	_idle()
	

func get_cooldown()->float:
	return Speed.cooldown

func _spawn(path_to_object:String)->void:
	var object:Falling_Object = load(path_to_object).instantiate()
	var pos :Vector2 = possible_points.get_children().pick_random().global_position
	
	_move(_get_pos(pos),get_cooldown())
	await get_tree().create_timer(get_cooldown()).timeout # to change
	bullet_stocker.add_child(object)
	object.global_position = pos

func _act()->void:
	var object:Array[String] = Referentiel.get_ref()
	
	_spawn(object[1])
	
func _idle()->void:
	# move idle
	var nb_time:int = randi_range(1,5)
	for i:int in range(nb_time):
		var new_array:Array[float] = possible_location.duplicate()
		new_array.erase(global_position.y)
		var pos:Vector2 = Vector2(global_position.x,new_array.pick_random())
		var duration:float = _get_action_cooldown()/nb_time
		_move(pos,duration)
		await get_tree().create_timer(duration).timeout
	
func _move(pos:Vector2,time:float)->void:
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(self,"global_position",pos,time)

func _get_pos(pos:Vector2)->Vector2:
	return Vector2(global_position.x,pos.y)

func _get_action_cooldown()->float:
	return $Timer.time_left
