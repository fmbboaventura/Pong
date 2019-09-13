extends KinematicBody2D

var velocity = Vector2()

export (int) var speed = 200

signal exit_screen_left
signal exit_screen_right

var hitSpark

# Called when the node enters the scene tree for the first time.
func _ready():
	hitSpark = load("res://scenes/HitSpark.tscn")
	reset_ball()

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	
	if collision:
		get_node("CollisionSound").play()
		var hsNode = hitSpark.instance()
		hsNode.position = collision.position
		hsNode.rotation = PI + velocity.angle()
		hsNode.emitting = true
		get_parent().add_child(hsNode)
		velocity = velocity.bounce(collision.normal)

func reset_ball():
	position.x = 0
	position.y = 0
	
	velocity = Vector2()
	velocity.x -= 1 if (randi() % 2) else -1
	velocity.y -= 1 if (randi() % 2) else -1

#warning-ignore:unused_argument
func _on_viewport_exited(viewport):
	get_node("FoulSound").play()
	if position.x < 0: emit_signal("exit_screen_left")
	else: emit_signal("exit_screen_right")
	reset_ball()
