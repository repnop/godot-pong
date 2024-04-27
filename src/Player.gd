extends CharacterBody3D

const SPEED: float = 5.0

func _physics_process(delta: float):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction.x > 0 or direction.x < 0:
		move_and_collide(Vector3(direction.x * SPEED * delta, 0, 0))
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
