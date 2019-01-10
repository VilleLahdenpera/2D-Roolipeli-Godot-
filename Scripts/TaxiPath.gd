extends Path2D

var acc = 0
var RayNode
onready var follow = get_node("PathFollow2D")

func _ready():
	set_process(true)

func _process(delta):
	acc += 0.01
	follow.set_offset(follow.get_offset() + 50 * delta + acc)