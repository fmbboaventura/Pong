extends MarginContainer

var p1ScoreLabel
var p2ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	p1ScoreLabel = get_node("HBoxContainer/MarginContainer1/P1Score")
	p2ScoreLabel = get_node("HBoxContainer/MarginContainer2/P2Score")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player1_score_changed(new_score):
	print("p1scorechanged " + str(new_score))
	p1ScoreLabel.text = str(new_score)
	
func _on_player2_score_changed(new_score):
	print("p2scorechanged " + str(new_score))
	p2ScoreLabel.text = str(new_score)
