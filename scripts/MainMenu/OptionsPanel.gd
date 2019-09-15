extends PopupPanel

export (Color) var unfocused_color
export (Color) var focused_color
var menuOptionsContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	menuOptionsContainer = get_node("VBoxContainer/MarginContainer/VBoxContainer")
	for i in menuOptionsContainer.get_child_count():
		menuOptionsContainer.get_child(i).connect("focus_entered", self, "on_option_focused", [i])
		menuOptionsContainer.get_child(i).connect("focus_exited", self, "on_option_unfocused", [i])
		
	get_node("VBoxContainer/MarginContainer/VBoxContainer").get_child(0).grab_focus()
	
func on_option_focused(index):
	var menuOption = menuOptionsContainer.get_child(index)
	menuOption.get_node("Label").set("custom_colors/font_color", focused_color)
	menuOption.get_node("Value").set("custom_colors/font_color", focused_color)

func on_option_unfocused(index):
	var menuOption = menuOptionsContainer.get_child(index)
	menuOption.get_node("Label").set("custom_colors/font_color", unfocused_color)
	menuOption.get_node("Value").set("custom_colors/font_color", unfocused_color)