extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var court = get_node("Court")
	var courtSize = court.texture.get_size()
	var viewportSize = get_viewport().size
	
	var camera = get_node("Camera2D")
	camera.zoom = courtSize / viewportSize

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
