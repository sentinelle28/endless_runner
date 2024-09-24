extends Node

var array_ref:Dictionary = {} #name:ref

func get_ref()->Array:
	var key:String = array_ref.keys().pick_random()
	return [key,array_ref[key]]
