extends ParallaxBackground

@export var speed:int = 1000
@onready var base:float = $ParallaxLayer/background_3.position.x
@onready var base_2:float = $ParallaxLayer/background_2.position.x
var offset_sprite:float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset_sprite+= delta
	$ParallaxLayer/background_3.position.x = base + sin(offset_sprite)*10
	$ParallaxLayer/background_2.position.x = base_2 + sin(offset_sprite)*(-2)
