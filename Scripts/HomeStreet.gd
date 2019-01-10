extends Area2D

var spawn_pos = Vector2()

func _ready():
	if global.world_spawn_point == "HomeStreet_home":
		set_spawn_point_home()
	get_tree().get_root().get_node("World/HomeStreet/YSort/Walls/Saleman/Saleman2/PathFollow2D/Saleman").connect("give_key", self, "get_key")
	$Enter_Home/Enter_Button.hide()
	$Enter_Home.hide()

func set_spawn_point_home():
	spawn_pos.x = -1000
	spawn_pos.y = -200
	get_node("YSort/Walls/Player").set_position(spawn_pos)
	$YSort/Walls/Taxi.queue_free()
	$YSort/Walls/Saleman.queue_free()

func _on_HomeStreet_body_entered(body):
	if body is KinematicBody2D and global.home_key == 1:
		$Enter_Home/Enter_Button.show()
		$Enter_Home.show()

func _on_HomeStreet_body_exited(body):
	if body is KinematicBody2D and global.home_key == 1:
		$Enter_Home/Enter_Button.hide()
		$Enter_Home.hide()

func _on_Enter_Button_pressed():
	global.world_spawn_point = "HomeStreet_home"
	get_tree().change_scene("res://Scenes/Rooms/Home.tscn")