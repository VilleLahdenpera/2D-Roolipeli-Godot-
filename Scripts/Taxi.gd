extends Path2D

var RayNode
onready var follow = get_node("PathFollow2D")

func _ready():
	set_process(true)

func _process(delta):
	if get_node("PathFollow2D/Saleman").get("InterAction") == false:
		follow.set_offset(follow.get_offset() + 50 * delta)
	
	
