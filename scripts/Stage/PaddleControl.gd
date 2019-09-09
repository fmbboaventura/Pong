extends KinematicBody2D

enum PlayerSlot {PLAYER_1, PLAYER_2}
export(PlayerSlot) var playerSlot
var actionPrefix

export (int) var speed = 200
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	actionPrefix = "p1_" if (playerSlot == PlayerSlot.PLAYER_1) else "p2_"
	print(actionPrefix)
	
func _input(event):
	if (event.is_action_pressed(actionPrefix + "up")):
		velocity.y -= 1
	elif (event.is_action_released(actionPrefix + "up")):
		velocity.y = 0
	
	if (event.is_action_pressed(actionPrefix + "down")):
		velocity.y += 1
	elif (event.is_action_released(actionPrefix + "down")):
		velocity.y = 0
		
	velocity = velocity.normalized()*speed

func _physics_process(delta):
    velocity = move_and_slide(velocity)
