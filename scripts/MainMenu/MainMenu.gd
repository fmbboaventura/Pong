extends MarginContainer

func _ready():
	get_node("VBoxContainer/HBoxContainer/MenuOptions/StartButton").grab_focus()

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartButton_pressed():
	var error = get_tree().change_scene("res://scenes/Stage.tscn")
	if (error):
		print ("erro")


func _on_OptionsButton_pressed():
	get_node("OptionsPanel").popup()


func _on_BackButton_pressed():
	get_node("OptionsPanel").hide()
	get_node("VBoxContainer/HBoxContainer/MenuOptions/OptionsButton").grab_focus()
