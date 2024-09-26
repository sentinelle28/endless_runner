extends Node
#name:ref
var array_ref:Dictionary = {
	"asteroids":"res://Entities/falling_object/asteroids.tscn",
	"coins":"res://Entities/falling_object/coins.tscn"





} 

func get_ref()->Array[String]:
	var key:String = array_ref.keys().pick_random()
	return [key,array_ref[key]]
