extends Node3D

signal increment_scores(player_score_increase: int, ai_score_increase: int)

var player_score = 0
var ai_score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	increment_scores.connect(_increase_score)

func _increase_score(player_score_increase: int, ai_score_increase: int):
	player_score += player_score_increase
	ai_score += ai_score_increase
	print("Player: %d, AI: %d" % [player_score, ai_score])
