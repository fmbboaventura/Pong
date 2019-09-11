extends KinematicBody2D

#warning-ignore:unused_class_variable
enum PlayerSlot {PLAYER_1, PLAYER_2}
export(PlayerSlot) var playerSlot
var actionPrefix

export (int) var speed = 200
var velocity = Vector2()

var score = 0
signal score_changed(new_score)

# Called when the node enters the scene tree for the first time.
func _ready():
	actionPrefix = "p1_" if (playerSlot == PlayerSlot.PLAYER_1) else "p2_"
	
	var ball = get_parent().get_node("Ball")
	if (playerSlot == PlayerSlot.PLAYER_1):
		ball.connect("exit_screen_right", self, "_increase_score")
	else: ball.connect("exit_screen_left", self, "_increase_score")
	
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

#warning-ignore:unused_argument
func _physics_process(delta):
	velocity.x = 0
	velocity = move_and_slide(velocity)

func _increase_score():
	score += 1
	emit_signal("score_changed", score)
