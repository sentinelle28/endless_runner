extends Node2D


@export var possible_points:Node2D
@export var bullet_stocker:Node
var possible_location:Array[float] = []
var is_idle:bool = true
@onready var previous_location:float = global_position.y
var speed:int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_points()
	$Timer.start(get_cooldown())
	

func _get_points()->void: #init
	for points:Node2D in possible_points.get_children():
		possible_location.append(points.global_position.y)


func _on_timer_timeout() -> void:
	$Timer.start(get_cooldown())
	is_idle = false
	_act()
	
	

func get_cooldown()->float:
	return Speed.cooldown

func _spawn(path_to_object:String)->void:
	var object:Falling_Object = load(path_to_object).instantiate()
	
	var new_array:Array[float] = possible_location.duplicate()
	new_array.erase(previous_location)
	var y_pick:float = new_array.pick_random()
	bullet_stocker.add_child(object)
	object.global_position = Vector2(possible_points.get_children()[0].global_position.x,y_pick)
	previous_location = y_pick

func _act()->void:
	var object:Array[String] = Referentiel.get_ref()
	_spawn(object[1])
	
func _idle()->void:
	# move idle
	var new_array:Array[float] = possible_location.duplicate()
	new_array.erase(previous_location)
	var y_pick:float = new_array.pick_random()
	previous_location = y_pick
	


func _get_pos(pos:Vector2)->Vector2:
	return Vector2(global_position.x,pos.y)

func _get_action_cooldown()->float:
	return $Timer.time_left

func _process(delta: float) -> void:
	global_position.y = lerp(global_position.y,previous_location,delta*speed)
	
	if is_idle:
		_idle()
		is_idle = false
		
	elif !is_idle and global_position.y == previous_location:
		is_idle = true
	
	
