extends Control
onready var scoreText = get_node("/root/Mainscene/CanvasLayer/UI/ScoreText")

func _ready():
	scoreText.text = "0"
func set_score_text(score):
		scoreText.text = str(score)
		print("Setting score to: ", score)
		
	



