extends Node
#name:ref
var array_ref:Dictionary = {
	"asteroids":"res://Entities/falling_object/asteroids.tscn",
	"coins":"res://Entities/falling_object/coins.tscn",
	"black_hole":"res://Entities/falling_object/black_hole.tscn",
	"ice":"res://Entities/falling_object/ice.tscn",
	"lava":"res://Entities/falling_object/lava.tscn"


} 

func get_ref()->Array[String]:
	var key:String = array_ref.keys().pick_random()
	return [key,array_ref[key]]
