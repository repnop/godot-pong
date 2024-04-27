extends StaticBody3D

signal reset_ball()

const SPEED: Vector3 = Vector3(3.0, 0, 3.0)

@onready var velocity := Vector3(0.0, 0.0, 0.0)
@onready var rng := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_ball.connect(_reset_ball)
	velocity.x = rng.randf_range(-3.0, 3.0)
	velocity.z = rng.randf_range(-3.0, 3.0)
	
func _reset_ball():
	position = Vector3(0.0, 0.0, 0.0)
	velocity.x = rng.randf_range(-3.0, 3.0)
	velocity.z = rng.randf_range(-3.0, 3.0)

func _process(delta):
	var collided := move_and_collide(velocity * (SPEED * delta))

	if collided:
		var collided_signal = collided.get_collider().get("collided_signal")
		if collided_signal != null:
			collided_signal.emit()
		velocity = velocity.bounce(collided.get_normal())
