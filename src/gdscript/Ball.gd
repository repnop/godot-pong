extends StaticBody3D

signal reset_ball()

const SPEED: Vector3 = Vector3(3.0, 0, 3.0)

@onready var velocity := Vector3(0.0, 0.0, 0.0)
@onready var rng := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_ball.connect(_reset_ball)
	var random_x_sign = 1 if rng.randi_range(0, 1) == 1 else - 1
	var random_z_sign = 1 if rng.randi_range(0, 1) == 1 else - 1
	
	velocity.x = rng.randf_range(1.5, 2.0) * random_x_sign
	velocity.z = rng.randf_range(1.5, 2.0) * random_z_sign
	
func _reset_ball():
	position = Vector3(0.0, 0.0, 0.0)
	var random_x_sign = 1 if rng.randi_range(0, 1) == 1 else - 1
	var random_z_sign = 1 if rng.randi_range(0, 1) == 1 else - 1
	
	velocity.x = rng.randf_range(1.5, 2.0) * random_x_sign
	velocity.z = rng.randf_range(1.5, 2.0) * random_z_sign

func _process(delta: float):

	if (velocity.z < 1.0) and (velocity.z > - 1.0):
		velocity.z += 0.35 * delta * (1 if velocity.z > 0 else - 1)

	var collided := move_and_collide(velocity * (SPEED * delta))

	if collided:
		var collided_signal = collided.get_collider().get("collided_signal")
		if collided_signal != null:
			collided_signal.emit()
		velocity = velocity.bounce(collided.get_normal()) + collided.get_collider_velocity() * delta
