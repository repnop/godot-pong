extends StaticBody3D

signal collided_signal()

@onready var reset_ball_signal: Signal = %Ball.reset_ball

func _ready():
	collided_signal.connect(func(): reset_ball_signal.emit(); get_node("/root/Level").increment_scores.emit(0, 1))
