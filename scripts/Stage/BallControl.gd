extends KinematicBody2D

var velocity = Vector2()

export (int) var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x -= 1 if (randi() % 2) else -1
	velocity.y -= 1 if (randi() % 2) else -1

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * speed * delta)
	if collision:
        velocity = velocity.bounce(collision.normal)
