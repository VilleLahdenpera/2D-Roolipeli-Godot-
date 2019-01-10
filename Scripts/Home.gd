extends Area2D


func _ready():
	$Leave_Home_Show/Leave_Button.hide()
	$Leave_Home_Show.hide()


func _on_Home_body_entered(body):
	if body is KinematicBody2D:
		$Leave_Home_Show/Leave_Button.show()
		$Leave_Home_Show.show()

func _on_Home_body_exited(body):
	if body is KinematicBody2D:
		$Leave_Home_Show/Leave_Button.hide()
		$Leave_Home_Show.hide()

func _on_Leave_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
