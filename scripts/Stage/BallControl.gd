extends KinematicBody2D

var velocity = Vector2()

export (int) var speed = 200

signal exit_screen_left
signal exit_screen_right

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	
	if collision:
        velocity = velocity.bounce(collision.normal)
		
	elif not get_node("VisibilityNotifier2D").is_on_screen():
		if position.x < 0: emit_signal("exit_screen_left")
		else: emit_signal("exit_screen_right")
		reset_ball()

func reset_ball():
	position.x = 0
	position.y = 0
	
	velocity = Vector2()
	velocity.x -= 1 if (randi() % 2) else -1
	velocity.y -= 1 if (randi() % 2) else -1
