extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("VBoxContainer/HBoxContainer/MenuOptions/StartButton").grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_QuitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_StartButton_pressed():
	var error = get_tree().change_scene("res://scenes/Stage.tscn")
	if (error):
		print ("erro")
	pass # Replace with function body.
