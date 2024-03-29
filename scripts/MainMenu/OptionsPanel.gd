extends PopupDialog

export (Color) var unfocused_color
export (Color) var focused_color
var menuOptionsContainer
var currentOption

# Called when the node enters the scene tree for the first time.
func _ready():
	menuOptionsContainer = get_node("VBoxContainer/MarginContainer/VBoxContainer")
	for i in menuOptionsContainer.get_child_count():
		menuOptionsContainer.get_child(i).connect("focus_entered", self, "on_option_focused", [i])
		menuOptionsContainer.get_child(i).connect("focus_exited", self, "on_option_unfocused", [i])
		menuOptionsContainer.get_child(i).connect("gui_input", self, "on_child_gui_input")
		
	get_node("VBoxContainer/MarginContainer/VBoxContainer").get_child(0).grab_focus()
	
	menuOptionsContainer.get_node("AspectRatio").setValue(GameSettings._aspectRatio)
	menuOptionsContainer.get_node("DisplayMode").setValue(GameSettings._displayMode)
	menuOptionsContainer.get_node("Resolution").setValue(GameSettings._resolution)
	menuOptionsContainer.get_node("VSYNC").setValue(GameSettings._vsync)
	
	menuOptionsContainer.get_node("AspectRatio").connect("value_changed", GameSettings, "setAspectRatio")
	menuOptionsContainer.get_node("DisplayMode").connect("value_changed", GameSettings, "setDisplayMode")
	menuOptionsContainer.get_node("Resolution").connect("value_changed", GameSettings, "setResolution")
	menuOptionsContainer.get_node("VSYNC").connect("value_changed", GameSettings, "setVSYNC")
	
func on_option_focused(index):
	var menuOption = menuOptionsContainer.get_child(index)
	menuOption.get_node("Label").set("custom_colors/font_color", focused_color)
	menuOption.get_node("Value").set("custom_colors/font_color", focused_color)
	currentOption = menuOption

func on_option_unfocused(index):
	var menuOption = menuOptionsContainer.get_child(index)
	menuOption.get_node("Label").set("custom_colors/font_color", unfocused_color)
	menuOption.get_node("Value").set("custom_colors/font_color", unfocused_color)
	
func on_child_gui_input(event):
	if (event.is_action_pressed("ui_left")):
		currentOption.previousValue()
	elif (event.is_action_pressed("ui_right")):
		currentOption.nextValue()


func _on_ApplyButton_pressed():
	GameSettings.applyAndSave()
