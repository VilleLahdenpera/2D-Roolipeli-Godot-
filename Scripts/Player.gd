extends KinematicBody2D

var spawn_point

export var MOTION_SPEED = 140
const IDLE_SPEED = 10

var Inventory = {}

var RayNode
var PlayerAnimNode
var anim = ""
var animNew = ""

func _ready():
	set_physics_process(true)
	RayNode = get_node("RayCast2D")
	PlayerAnimNode = get_node("AnimatedSprite")

func _process(delta):
	var motion = Vector2() # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
		RayNode.set_rotation_degrees(90)
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
		RayNode.set_rotation_degrees(-90)
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
		RayNode.set_rotation_degrees(0)
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
		RayNode.set_rotation_degrees(180)
	motion = motion.normalized() * MOTION_SPEED * delta
	move_and_collide(motion)
	
	#Animaatiot
	if motion.length() > IDLE_SPEED * 0.09:
		if Input.is_action_pressed("ui_up"):
			anim = "back"
		if Input.is_action_pressed("ui_down"):
			anim = "front"
		if Input.is_action_pressed("ui_right"):
			anim = "right"
		if Input.is_action_pressed("ui_left"):
			anim = "left"
	else:
		if RayNode.get_rotation_degrees() == 180:
			anim = "idle_back"
		if RayNode.get_rotation_degrees() == 0:
			anim = "idle_front"
		if RayNode.get_rotation_degrees() == -90:
			anim = "idle_left"
		if RayNode.get_rotation_degrees() == 90:
			anim = "idle_right"
	if anim != animNew:
		animNew = anim
		PlayerAnimNode.play(anim)


