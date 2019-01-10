extends KinematicBody2D

const SPEED = 600
const GRAVITY = 20
const JUMP_POWER = -400
const FLOOR = Vector2(0, -1)

var motion = Vector2()

var on_ground = false
var side = "right"
var jump_delay = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		side = "right"
		$AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		side = "left"
		$AnimatedSprite.play("left")
	else:
		motion.x = 0
		if side == "right":
			$AnimatedSprite.play("idle_right")
		if side == "left":
			$AnimatedSprite.play("idle_left")

	jump_delay += 1
	if Input.is_action_pressed("ui_up") and jump_delay > 50:
		if on_ground == true:
			motion.y = JUMP_POWER
			jump_delay = 0
			on_ground = false
	if on_ground == false:
		if side == "right":
			$AnimatedSprite.play("jump_right")
		if side == "left":
			$AnimatedSprite.play("jump_left")
	motion.y += GRAVITY

	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	motion = move_and_slide(motion, FLOOR)


