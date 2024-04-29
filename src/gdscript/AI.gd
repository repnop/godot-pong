extends CharacterBody3D

const SPEED: float = 5.0

func _physics_process(delta: float):
    var ballPosition: Vector3 = get_node("../Ball").position
    var newVelocity := Vector3(0.0, 0.0, 0.0)

    if abs(ballPosition.x - position.x) < 1:
        return

    if ballPosition.x < position.x:
        newVelocity.x = -SPEED * delta
    elif ballPosition.x > position.x:
        newVelocity.x = SPEED * delta
    
    move_and_collide(newVelocity)