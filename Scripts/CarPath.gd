extends Path2D

var RayNode
onready var follow = get_node("PathFollow2D")
var car_types = ["red", "taxi"]
var AnimNode
func _ready():
	set_process(true)
	AnimNode = get_node("PathFollow2D/Area2D/Sprite")
	AnimNode.play(car_types[randi() % car_types.size()])

func _process(delta):
	
	follow.set_offset(follow.get_offset() + 300 * delta)