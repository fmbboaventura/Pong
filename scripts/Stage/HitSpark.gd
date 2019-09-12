extends Particles2D

export (float) var offset = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Selfdestruct").lifetime = (lifetime + offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
