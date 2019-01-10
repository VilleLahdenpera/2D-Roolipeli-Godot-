extends Area2D

var dir = Vector2()
var dir_old = Vector2()
var Body
var PlayerAnimNode
var anim = ""
var animNew = ""
var InterAction
var ButtonPresses = 0


func _ready():
	set_physics_process(true)
	Body = get_node("../Saleman")
	PlayerAnimNode = get_node("AnimatedSprite")
	$DiagButton.hide()
	$Dialog.hide()

func _process(delta):
	anim = "front"
	if InterAction == false:
		dir = Body.get_global_position()
		if dir.x > (dir_old.x - 0.5):
			anim = "right"
		if dir.y < (dir_old.y - 0.5):
			anim = "up"
		if dir.y < -350: #Disables collision when he exits the area
			$StaticBody2D/CollisionShape2D.disabled = true
		dir_old = dir
	if anim != animNew:
		animNew = anim
		PlayerAnimNode.play(anim)
	if InterAction == true:
		if ButtonPresses == 0:
			$Dialog.text = "Hey!"
		if ButtonPresses == 1:
			$Dialog.text = "Here's your\nkeys. The room\nis furnished\n as agreed."
		if ButtonPresses == 2:
			$Dialog.text = "Well.\nHave a nice day.\nBye!"
		$Dialog.show()
		$DiagButton.show()
	if ButtonPresses >= 3:
		$DiagButton.hide()
		$Dialog.hide()
		global.home_key = 1
		InterAction = false


func _on_Saleman_body_entered(body):
	if body is KinematicBody2D:
		InterAction = true


func _on_Saleman_body_exited(body):
	if body is KinematicBody2D:
		$Dialog.hide()
		$DiagButton.hide()


func _on_DiagButton_pressed():
	ButtonPresses += 1
